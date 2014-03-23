(function() {
  'use strict';

  var arabicToRoman = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I"
  };

  var sortedArabic = Object.keys(arabicToRoman).sort(function(a, b) {
    return b - a;
  });

  module.exports = function(arabic) {
    var currentRomanNumeral = "";
    sortedArabic.forEach(function(arabicNumeral) {
      if (arabicToRoman.hasOwnProperty(arabicNumeral)) {
        while (arabic >= arabicNumeral) {
          arabic -= arabicNumeral;
          currentRomanNumeral += arabicToRoman[arabicNumeral];
        }
      }
    })
    return currentRomanNumeral;
  };

})();