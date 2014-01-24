(function() {
  'use strict';

  var Phone = function(number) {
    this.numberCandidate = number.match(/\b\d+\b/g).join("");
    this.formattedNumber = this._formatNumber(this.numberCandidate);
  }

  Phone.prototype.number = function() {
    return this.formattedNumber;
  }

  Phone.prototype.areaCode = function() {
    return this.number().substring(0, 3);
  }

  Phone.prototype.toString = function() {
    var number = this.number();
    return ["(", this.areaCode(), ") ", number.substring(3, 6), "-", number.substring(6, 10)].join("")
  }

  Phone.prototype._formatNumber = function(num) {
    var length = num.length
    if (length == 11 && num.charAt(0) == "1" ) {
      return num.slice(1)
    } else if (length != 10) {
      return this._invalid_number
    } else {
      return num;
    }
  }

  Phone.prototype._invalid_number = function() {
    return "0000000000";
  }();

  module.exports = Phone;

})();