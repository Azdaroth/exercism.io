(function() {
  'use strict';

  function Binary(binary) {
    this.binary = binary;
  }

  Binary.prototype.toDecimal = function() {
    if (!this._isValid()) {
      return 0;
    }
    var binaryNumbers = this._prepareNumbers();    
    return binaryNumbers.reduce(function(sum, binary, power) {
      return sum += Math.pow(2, power) * binary;
    });
  };

  Binary.prototype._prepareNumbers = function() {    
    return this.binary.split("").reverse().map(function(number) {
      return parseInt(number);
    });
  };

  Binary.prototype._isValid = function() {
    return !isNaN(parseInt(this.binary));
  };

  module.exports = Binary;

})();