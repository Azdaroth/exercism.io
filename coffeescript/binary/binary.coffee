class Binary

  constructor: (number) ->
    @number = number

  toDecimal: ->
    return 0 if isNaN(parseInt(@number))

    numbers = this._reverse_binary()

    numbers.reduce (decimal, binary, power) ->
      decimal += Math.pow(2, power) * binary

  _reverse_binary: ->
    @number.split("").reverse("").map (number) ->
      parseInt(number)


module.exports = Binary
  