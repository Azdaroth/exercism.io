(function() {
  'use strict';

  var School = function(name) {
    this.db = {};
    this.name = name;
  }

  School.prototype.add = function(student, grade) {
    var students = this.grade(grade);
    students.push(student);
    this.db[grade] = students; 
  };

  School.prototype.grade = function(number) {
    return this.db[number] || [];
    };

  School.prototype.sort = function() {
    var sorteddb = {}
    for (var grade in this.db) {
      sorteddb[grade] = this.grade(grade).sort();
    }
    return sorteddb;
  };

  module.exports = School;
})();