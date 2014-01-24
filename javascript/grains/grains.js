(function() {
  'use strict';

  function Grains() {
    this.squaresNumber = 64;
  };
  
  Grains.prototype.square = function(number) {
    return Math.pow(2, number - 1);
  };

  Grains.prototype.total = function() {
    var i = 0;
    var sum = 0;
    for(i = 1; i <= this.squaresNumber; i++) {
      sum += this.square(i);
    }
    return sum;
  };

  module.exports = Grains;

})();