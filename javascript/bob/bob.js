var Bob = function() {

  this.hey = function(sentence) {
    message = new Message(sentence);
    switch(true)
    {
    case message.is_silence():
      return 'Fine, be that way.'
    case message.is_question():
      return 'Sure';
    case message.is_shouting():
      return 'Woah, chill out!';
    default:
      return "Whatever";
    }
  }

};

var Message = function(message) {

  this.message = message.trim();

  this.is_shouting = function() {
    return this.message == this.message.toUpperCase();
  }

  this.is_question = function() {
    return message.slice(-1) == "?";
  }

  this.is_silence = function() {
    return !message;
  }

}

module.exports = Bob;