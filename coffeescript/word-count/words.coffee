class Words

  constructor: (@input) ->
    @words = @input.toLowerCase().match(/\w+/g)
    @count = this.count()

  count: ->
    counter = {}
    for word in @words
      currentCount = counter[word] || 0
      counter[word] = currentCount += 1
    counter

module.exports = Words