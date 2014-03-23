class Hexadecimal 

  constructor: (number) ->
    @number = number
    @hexadecimalToDecimalMapping = {
      "0": 0,
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9,
      "a": 10,
      "b": 11,
      "c": 12,
      "d": 13,
      "e": 14,
      "f": 15
    }

  toDecimal: ->

    return 0 if !this._isValidNumber()

    mapping = this.hexadecimalToDecimalMapping
    reversed = this._splitReversedNumber()
    reversed.reduce (accum, currentNumber, index) ->
      accum += Math.pow(16, index) * mapping[currentNumber]
    , 0

  _splitReversedNumber: ->
    @number.split("").reverse()

  _isValidNumber: ->
    mapping = this.hexadecimalToDecimalMapping
    
    this._splitReversedNumber().every (num) ->
      mapping[num] != undefined    

module.exports = Hexadecimal