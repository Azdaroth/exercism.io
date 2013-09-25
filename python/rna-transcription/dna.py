class DNA(object):
  
    def __init__(self, strand):
        self.strand = strand

    def to_rna(self):
        return self.strand.replace("T", "U")
    