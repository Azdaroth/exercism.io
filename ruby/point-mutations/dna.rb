class DNA
  
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    (@strand.chars.zip other_strand.chars).count do |nuclecotide, other_nucleotide|
      other_nucleotide && nuclecotide != other_nucleotide
    end
  end

 
end