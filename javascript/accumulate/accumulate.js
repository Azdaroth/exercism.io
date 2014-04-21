(function() {

  'use strict';

  module.exports = function(collection, callback) {
    var newCollection = []
    collection.forEach(function(el) {
      newCollection.push(callback(el));
    });
    return newCollection;
  }

})();