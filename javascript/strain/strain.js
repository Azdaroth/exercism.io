(function() {

  'use strict';

  var Collection = {};

  Collection.keep = function(collection, callback) {
    var newCollection = [];
    collection.forEach(function(el) {
      if (callback(el)) {
        newCollection.push(el)
      }
    })
    return newCollection;
  }

  Collection.discard = function(collection, callback) {
    var newCollection = [];
    collection.forEach(function(el) {
      if (!callback(el)) {
        newCollection.push(el)
      }
    })
    return newCollection;
  }

  module.exports = Collection;

})();


