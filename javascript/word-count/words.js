var Words = function(sentence) {

  this.sentence = sentence;

  this.count = function() {

    var counts = {};
    var words = sentence.toLowerCase().match(/\w+/g);

    for(var i=0; i < words.length; i++) {

      var current_word = words[i];

      if (counts[current_word]) {
        counts[current_word] += 1
      } else  {
        counts[current_word] = 1
      }
    }

    return counts;
  }();
  
};


module.exports = Words;