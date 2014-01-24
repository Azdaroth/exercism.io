(function() {
  'use strict';

  module.exports = function(oldData) {
    var transformedData = {};
    for (var point in oldData) {
      var words = oldData[point];
      for (var i = 0 ; i < words.length; i++) {
        var currentWord = words[i].toLowerCase();
        transformedData[currentWord] = parseInt(point);
      };
    }
    return transformedData;
  }        
})();