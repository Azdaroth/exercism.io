class Trinary

  constructor: (number) ->
    @number = number

  toDecimal: ->
    return 0 if isNaN(parseInt(@number))

    numbers = this._reversed()

    numbers.reduce (decimal, base, power) ->
      decimal += Math.pow(3, power) * base

  _reversed: ->
    @number.split("").reverse("").map (number) ->
      parseInt(number)


module.exports = Trinary
  