(function() {
  'use strict';

  function Grouper(dividePoint) {
    this.dividePoint = dividePoint;
  }

  Grouper.prototype.divide = function(text) {
    var dividePoint = this.dividePoint;
    var newText = []
    var self = this;

    text.split("").forEach(function(letter, index) {
      newText.push(letter)
      if (self.skipFirstAndLastPlace(index, text.length) && self.isDividePoint(index)) {
        newText.push(" ");
      }
    });
    return newText.join("")
  }

  Grouper.prototype.skipFirstAndLastPlace = function(currentIndex, length) {
    return currentIndex > 0 && currentIndex + 1 < length;
  }

  Grouper.prototype.isDividePoint = function(currentIndex) {
    return (currentIndex + 1) % this.dividePoint === 0;
  }


  function Atbash(dividePoint) {
    this.grouper = new Grouper(dividePoint);
    this.alphabet = "abcdefghijklmnopqrstuvwxyz".split("");
    this.alphabetLength = this.alphabet.length;
  };

  Atbash.prototype.encode = function(text) {
    var self = this;
    var encoded = text.toLowerCase().match(/[a-z0-9]/g).map(function(letter) {
      return self._reverseLetter(letter);
    }).join("");
    return this.grouper.divide(encoded);
  }

  Atbash.prototype._reverseLetter = function(currentElement) {
    var indexOfLetter = this.alphabet.indexOf(currentElement) 
    if (indexOfLetter !== -1) {
      var reversedIndex = this.alphabetLength - 1 - indexOfLetter
      return this.alphabet[reversedIndex];
    } else {
      return currentElement;
    }
  }
  var AtbashInterface = {

    encode: function(text) {
      return new Atbash(5).encode(text);
    }

  };

  module.exports = AtbashInterface;

})();