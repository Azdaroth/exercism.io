(function() {

  'use strict';

  function Allergies(score) {
    this.score = score;
    this.scores = [1, 2, 4, 8, 16, 32, 64, 128];
    this.allergies = ["eggs", "peanuts", "shellfish", 
      "strawberries", "tomatoes", "chocolate", "pollen", "cats"];
    this.scoresToAllergiesMapping = this._zipScoresAllergies();
  }

  Allergies.prototype.list = function() {
    var validScores = this.score % 256;
    var allergy;
    var currentScore = validScores;
    var availableScores = validScores;
    var list = [];
    while(currentScore > 0) {
      if((allergy = this.scoresToAllergiesMapping[currentScore]) && (availableScores - currentScore >= 0)) {
        list.push(allergy);
        availableScores -= currentScore;
      } 
      currentScore -= 1
    }
    return list.reverse();
  }

  Allergies.prototype.allergicTo = function(allergy) {
    return this.list().indexOf(allergy) !== -1;
  }

  Allergies.prototype._zipScoresAllergies = function() {
    var scoresToAllergiesMapping = {}, i = 0, currentScore, currentAllergy
    for(i; i < this.scores.length; i++) {
      currentScore = this.scores[i];
      currentAllergy = this.allergies[i]
      scoresToAllergiesMapping[currentScore] = currentAllergy;
    };
    return scoresToAllergiesMapping;
  }

  module.exports = Allergies;

})();