class Prime 

  @nth: (number) ->
    @_validate(number)
    @_findPrime(number)

  @_validate: (number) ->
    throw "Prime is not possible" if number < 1

  @_findPrime: (amount) ->
    currentNum = 2
    collection = []
    while collection.length < amount
      if (!collection.some (prime) -> (currentNum % prime is 0))
        collection.push(currentNum)
      currentNum += 1;
    collection[amount - 1]

module.exports = Prime