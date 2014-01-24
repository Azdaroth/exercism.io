function DNA(strand) {

  this.strand = strand.split('');
  this.validNucleotides = ["A", "T", "C", "G", "U"];
  this.counter = { A : 0, T : 0, C : 0, G : 0 };

  this.count = function(nucleotide) {
    this.validateNucleotide(nucleotide);
    var count = 0;
    this.strand.reduce(function(previous, currentNucleotide) {
      if (currentNucleotide == nucleotide) {
        count += 1;
      } 
    }, 0);
    return count;
  };

  this.validateNucleotide = function(nucleotide) {
    if(this.validNucleotides.indexOf(nucleotide) == -1) {
      throw new Error("Invalid Nucleotide");
    }
  };

  this.nucleotideCounts = function() {
    var countableNucleotides = ["A", "T", "C", "G"];
    var self = this;
    countableNucleotides.reduce(function(previous, currentNucleotide) {
      self.counter[currentNucleotide] = self.count(currentNucleotide); 
    }, 0);
    return self.counter;
  };

  this.nucleotideCounts = this.nucleotideCounts();
};

module.exports = DNA;




