(function() {
  "use strict";

  var robotsNames = [];

  function RandomsGenerator() {};

  RandomsGenerator.prototype.letters = function(length) {

    var allLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    var maxIndex = allLetters.length - 1;
    var letters = ""

    for(var i = 0 ; i < length ; i++) {
      var index = this.digits(2) % (maxIndex)
      letters += allLetters[index];
    }

    return letters;

  };

  RandomsGenerator.prototype.digits = function(length) {
    var randomNumber = "";
    var generator = new RandomsGenerator();

    for (var i = 0 ; i < length ; i++) {
      var number = Math.floor((Math.random() * 10));
      // special case if happens to be octal
      if (i === 0 && number === 0) {
        number = this.digits(1);
      }
      randomNumber += new String(number).toString();
    }
    
    return parseInt(randomNumber);
  };
  
  function Robot() {
    this.generator = new RandomsGenerator();
    this.name = this.generateName();
  };

  Robot.prototype.generateName = function() {
    var lettersPart = this.generator.letters(2)
    var digitsPart = new String(this.generator.digits(3)).toString();
    var name = lettersPart + digitsPart;
    var self = this;
    for(var i = 0; i < robotsNames.length; i++) {
      if (name == robotsNames[i]) {
        self.generateName();
      }
    }
    robotsNames.push(name);
    return name;
  };

  Robot.prototype.reset = function() {
    this.name = this.generateName();
  }

  module.exports = Robot;
})();