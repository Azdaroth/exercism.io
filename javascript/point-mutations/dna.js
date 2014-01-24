function DNA(strand) {

  this.strand = strand;

}

DNA.prototype.hammingDistance = function(otherStrand) {
  var distance = 0;
  var limit = Math.min(this.strand.length, otherStrand.length);
  for(var i = 0 ; i < limit; i++) {
    var nucleotide = this.strand[i]
    var otherNucleotide = otherStrand[i]
    if(nucleotide != otherNucleotide) {
      distance++;
    }
  };
  return distance;
};

module.exports = DNA;