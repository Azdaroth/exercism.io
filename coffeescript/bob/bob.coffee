class Bob
  hey: (message) ->  
    message = new Message(message)
    switch  
      when message.isShouting() then "Woah, chill out!"
      when message.isQuestion() then "Sure."
      when message.isSilence() then "Fine. Be that way!"
      else "Whatever."

class Message

  constructor: (@message) ->
    @message = @message.trim()

  isShouting: ->
    @message and @message.toUpperCase() is @message

  isSilence: ->    
    @message is ""

  isQuestion: ->
    @message.slice(-1) is "?"

module.exports = Bob