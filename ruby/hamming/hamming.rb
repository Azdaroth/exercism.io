module Hamming
  
  extend self

  def compute(strand, other_strand)
    pairs(strand, other_strand).count do |nucleotide, other_nucleotide|
      nucleotide && other_nucleotide && nucleotide != other_nucleotide
    end
  end

  private

    def pairs(strand, other_strand)
      strand.chars.zip(other_strand.chars)
    end

end