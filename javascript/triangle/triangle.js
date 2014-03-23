(function() {
  'use strict';

  Array.prototype.unique = function() {
    var uniqueArray = [];
    for (var i = 0; i < this.length ; i++) {
      var currentElement = this[i];
      if (uniqueArray.indexOf(currentElement) === -1) {
        uniqueArray.push(currentElement);
      }
    };
    return uniqueArray;
  }

  function Triangle(a, b, c) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.sides = [a, b, c];
  };

  Triangle.prototype.kind = function() {
    if (!this.isValid()) {
      return 'illegal';
    }
    var kind;
    if (this.isEquilateral()) {
      kind = 'equilateral';
    } else if(this.isIsosceles()) {
      kind = 'isosceles';
    } else if(this.isScalene()) {
      kind = 'scalene';
    }
    return kind;
  };

  Triangle.prototype.isEquilateral = function() {
    return this.sides.unique().length === 1;
  };

  Triangle.prototype.isIsosceles = function() {
    return this.sides.unique().length === 2;
  };

  Triangle.prototype.isScalene = function() {
    return this.sides.unique().length === 3;
  };

  Triangle.prototype.isValid = function() {
    return Math.abs(this.a - this.b) < this.c && this.c < this.a + this.b;
  };

  module.exports = Triangle;
})();