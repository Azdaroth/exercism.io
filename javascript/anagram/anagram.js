function Anagram(word) {

  this.word = new FormattedWord(word);

  this.match = function(candidates) {
    var anagrams = [];
    for (var i = 0; i < candidates.length; i++) {
      var currentWord = candidates[i];
      var currentCandidate = new FormattedWord(currentWord);
      if (this.word.isAnagramOf(currentCandidate)) {
        anagrams.push(currentWord);
      };
    };
    return anagrams;
  };

}

function FormattedWord(word) {

  this.standardized = word.toLowerCase();
  this.sorted = this.standardized.split("").sort().join("");

  this.isAnagramOf = function(otherWord) {
    return this.standardized != otherWord.standardized && this.sorted == otherWord.sorted;
  };

}

module.exports = Anagram;