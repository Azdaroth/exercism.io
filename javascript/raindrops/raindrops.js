(function() {
  'use strict';

  function Raindrops() {

    this.divisorsWordsMapping = {
      3: "Pling",
      5: "Plang",
      7: "Plong"
    };

  }

  Raindrops.prototype.convert = function(number) {
    if (!this._isDivisible(number)) {
      return number.toString();
    }

    var val = "";

    for(var divisor in this.divisorsWordsMapping) {
      if (number % divisor === 0) {
        val += this.divisorsWordsMapping[divisor];
      }
    }

    return val;
  }

  Raindrops.prototype._isDivisible = function(number) {
    for(var divisor in this.divisorsWordsMapping) {
      if (number % divisor === 0) {
        return true;
      }
    } 
    return false;
  }

  module.exports = Raindrops;

})();