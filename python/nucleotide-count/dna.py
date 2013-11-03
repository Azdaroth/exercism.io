class DNA(object):
  
    _ALL_NUCLEOTIDES = ["A", "T", "C", "G", "U"]
    _DNA_NUCLEOTIDES = ["A", "T", "C", "G"]

    def __init__(self, sequence):
        self.sequence = sequence

    def count(self, nucleotide):
        self._validate_nucleotide(nucleotide)
        return self.sequence.count(nucleotide)

    def nucleotide_counts(self):
        return {
            nucleotide: self.count(nucleotide) 
            for nucleotide in self._DNA_NUCLEOTIDES
        }

    def _validate_nucleotide(self, nucleotide):
        if nucleotide not in self._ALL_NUCLEOTIDES:
            raise ValueError('%s is not a nucleotide.' % nucleotide)


    
    