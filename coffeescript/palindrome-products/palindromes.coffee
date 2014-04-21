Array.prototype.uniq = ->
  uniqueArray = []
  this.forEach (el) ->
    uniqueArray.push(el) if not uniqueArray.indexOf(el)
  uniqueArray

Array.prototype.find = (callback) ->
  existingElement = undefined
  this.forEach (el) -> 
    existingElement = el if callback(el)
  existingElement

class Palindromes 

  constructor: (options) ->
    throw "You must specify max factor" if !options.maxFactor
    @minFactor = options.minFactor || 1
    @maxFactor = options.maxFactor 
    @range = [@minFactor..@maxFactor]
    @palindromes = []
  
  generate: ->
    addedFactors = []
    @palindromes = []
    for x in @range
      for y in @range
        product = x*y
        factors = [x,y]
        if @_isPalindrome(product) and not @_factorsAdded(addedFactors, factors)
          @_appendPalindrome(product, factors)
          addedFactors.push(factors)

  largest: ->
    @palindromes.reduce (previous, current) -> 
      if previous.value > current.value then previous else current

  smallest: ->
    @palindromes.reduce (previous, current) -> 
      if previous.value < current.value then previous else current    

  _isPalindrome: (number) ->     
    separateNumbers = number.toString().split("")
    separateNumbers.join("") is separateNumbers.reverse().join("")

  _appendPalindrome: (product, factors) ->
    existingPalindrome = @palindromes.find (el) -> el.value is product 
    if existingPalindrome
      existingPalindrome.addFactors(factors)
    else
      @palindromes.push(new Palindrome(product, factors)) 

  _factorsAdded: (addedFactors, factors) ->
    added = false
    addedFactors.forEach (collection) ->
      if collection.sort().join("") is factors.sort().join("")
        added = true 
    added
    
class Palindrome 

  constructor: (value, factors) ->
    @value = value
    @factors = [factors]

  addFactors: (newFactors) ->
    @factors.push(newFactors)

module.exports = Palindromes