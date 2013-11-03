class DNA(object):
  
    def __init__(self, strand):
        self.strand = strand

    def hamming_distance(self, other_strand):
        return len([(nucleotide, other_nucleotide) 
            for nucleotide, other_nucleotide in self._pairs(other_strand)
            if nucleotide != other_nucleotide
        ])

    def _pairs(self, other_strand):
        return zip(self.strand, other_strand)