class Anagram

  constructor: (word) ->
    @formatted_word = new FormattedWord(word)

  match: (words) ->    
    formatted_words = words.map (word) ->
      new FormattedWord(word)  
    (formatted_word.normalized() for formatted_word in formatted_words when formatted_word.eq(this.formatted_word))


class FormattedWord

  constructor: (word) ->
    @original = word
    
  sorted: ->
    this.normalized().split("").sort().join("")

  normalized: ->
    this.original.toLowerCase()

  eq: (other_word) ->
    this.normalized() != other_word.normalized() and this.sorted() is other_word.sorted()

module.exports = Anagram
  