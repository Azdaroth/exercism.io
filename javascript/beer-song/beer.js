var Beer = function() {

  var _zero_bottles = "No more bottles of beer on the wall, no more bottles of beer.\n" +
              "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
  var _one_bottle = "1 bottle of beer on the wall, 1 bottle of beer.\n" + 
            "Take it down and pass it around, no more bottles of beer on the wall.\n";
  var _two_bottles = "2 bottles of beer on the wall, 2 bottles of beer.\n" + 
            "Take one down and pass it around, 1 bottle of beer on the wall.\n";

  function _multiple_bottles(num) {
    return num +" bottles of beer on the wall, " + num + 
          " bottles of beer.\nTake one down and pass it around, " + (num - 1) +
          " bottles of beer on the wall.\n";
  }

  var _responses = { 0: _zero_bottles, 1: _one_bottle, 2: _two_bottles }

  return {

    verse: function(num) {;
      if (_responses[num] ===  undefined) {
        return _multiple_bottles(num);
      } else {
        return _responses[num];
      }
    },

    sing: function(start, end) {
      end = end || 0;
      var verses = []
      for (var i = start; i >= end; i--) {
        verses.push(this.verse(i));
      };
      return verses.join("\n");
    } 

  };

}();


module.exports = Beer;