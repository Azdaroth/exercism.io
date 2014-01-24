function DNA(strand) {

  this.toRNA = function() {
    return strand.replace(/T/g, "U");
  }
}


module.exports = DNA;