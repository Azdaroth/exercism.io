(function(){
  'use strict';

  function SpaceAge(seconds) {
    this.seconds = seconds;
    this.earthYearInSeconds = 31557600;
  }

  var planetsWithRelativeToEarthMultipliers = {
    "Earth": 1,
    "Mercury": 0.240846,
    "Venus": 0.61519726,
    "Mars": 1.8808158,
    "Jupiter": 11.862615,
    "Saturn": 29.447498,
    "Uranus": 84.016846,
    "Neptune": 164.79132
  }

  for (var planet in planetsWithRelativeToEarthMultipliers) {
    (function(planet) {
      SpaceAge.prototype["on" + planet] = function() {
        var multiplier = planetsWithRelativeToEarthMultipliers[planet];
        return this._calculate(multiplier);
      }
    })(planet);    
  }

  SpaceAge.prototype._calculate = function(multiplier) {
    var value = (this.seconds / this.earthYearInSeconds) / multiplier
    return this._round(value);
  };

  SpaceAge.prototype._round = function(value) {
    return Math.round(value * 100) / 100;
  };

  module.exports = SpaceAge;

})();