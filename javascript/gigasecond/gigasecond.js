(function() {

  'use strict';

  function Gigasecond(birthDate) {
    this.birthDate = birthDate;
    this.interval = 1000000000000;
  };

  Gigasecond.prototype.date = function() {
    var gigasecondCelebrationDate = new Date(this.birthDate.getTime() + this.interval);
    return this._beginningOfTheDay(gigasecondCelebrationDate);
  };

  Gigasecond.prototype._beginningOfTheDay = function(date) {
    date.setSeconds(0);
    date.setMinutes(0);
    date.setHours(0);
    return date;
  };

  module.exports = Gigasecond;

})();