class Wordy

  constructor: (problem) ->
    @problem = problem
    @numbersCaptureRegexp = /[\d-]+/g
    @operationsCaptureRegexp = /(plus)|(minus)|(multiplied)|(divided)/g
    @numbers = @_extract_numbers()
    @operations = @_extract_operations()
    @ERROR = {
      tooComplicated: "Unable to perform operation"
    }

  answer: ->
    throw @ERROR.tooComplicated unless @_operations_and_numbers_present(@operations, @numbers)
    currentResult = @numbers.shift()
    @_calculate(currentResult, @operations, @numbers)

  _extract_numbers: ->
    numbers = @problem.match(@numbersCaptureRegexp)
    if numbers
      numbers.map (num) -> parseInt(num)
    else 
      []

  _extract_operations: ->
    operations = @problem.match(@operationsCaptureRegexp)
    if operations then operations else []

  _calculate: (result, operations, numbers) ->
    return result unless @_operations_and_numbers_present(operations, numbers)
    operation = operations.shift()
    number = result
    otherNumber = numbers.shift()
    currentResult = new Operation(operation, number, otherNumber).perform()
    @_calculate(currentResult, operations, numbers)

  _operations_and_numbers_present: (operations, numbers) ->
    operations.length > 0 and numbers.length > 0

class Operation

  constructor: (type, number, otherNumber) ->
    @type = type
    @number = number
    @otherNumber = otherNumber

  perform: ->
    switch @type
      when "plus"
        @number + @otherNumber
      when "minus"
        @number - @otherNumber
      when "multiplied"
        @number * @otherNumber
      when "divided"
        @number / @otherNumber

module.exports = Wordy
  