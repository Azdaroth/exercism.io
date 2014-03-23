(function() {
  'use strict';

  var PrimeFactors = {
    for: function(number) {
      
      var currentFactor = 2;
      var factors = [];
      var currentNumber = number;

      while(currentNumber > 1) {
        while(currentNumber % currentFactor === 0) {
          factors.push(currentFactor)
          currentNumber /= currentFactor;
        }
        currentFactor += 1;
      }
      return factors;
    }
  }


  module.exports = PrimeFactors;

})();