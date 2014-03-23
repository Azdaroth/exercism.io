class Luhn

  @create: (number) ->
    return number if new Luhn(number).valid
    candidate = number * 10
    while ! new Luhn(candidate).valid
      candidate += 1
    candidate

  constructor: (number) ->
    @number = number
    @checkDigit = this._checkDigit()
    @addends = this._addends()
    @checksum = this._checksum()
    @valid = this._isValid()

  _checkDigit: -> 
    parseInt(String(this.number).slice(-1))

  _addends: ->
    this._splitNumber().reverse().map (num, idx) ->
      currentNum = num
      currentNum = num * 2 if idx % 2 is 1      
      currentNum -= 9 if currentNum >= 10
      currentNum
    .reverse()

  _checksum: ->
    @addends.reduce (accum, num) ->
      accum += num

  _isValid: ->
    parseInt(String(@checksum).slice(-1)) is 0

  _splitNumber: ->
    String(this.number).split("").map (num) ->
      parseInt(num)


module.exports = Luhn
  