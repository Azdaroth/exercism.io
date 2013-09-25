class DNA

  ALL_NUCLEOTIDES = ["A", "T", "C", "G", "U"]
  DNA_NUCLOTIDES = ["A", "T", "C", "G"]
  
  attr_reader :sequence
  def initialize(sequence)
    @sequence = sequence
  end

  def count(nucleotide)
    verify_nucleotide(nucleotide)
    counter.count_nucleotide_occurences(nucleotide)
  end

  def nucleotide_counts
    counter.count_all_nucleotides(DNA_NUCLOTIDES)
  end

  private

    def counter
      @counter ||= Counter.new(sequence)
    end

    def verify_nucleotide(nucleotide)
      raise ArgumentError.new("#{nucleotide} is not a valid nucleotide.") unless ALL_NUCLEOTIDES.include? nucleotide
    end
    
end


class Counter

  attr_reader :sequence
  def initialize(sequence)
    @sequence = sequence
  end

  def count_nucleotide_occurences(nucleotide)
    sequence.count(nucleotide)
  end

  def count_all_nucleotides(valid_nucleotides)
    valid_nucleotides.each_with_object({}) do |nucleotide, count|
      count[nucleotide] = count_nucleotide_occurences(nucleotide)
    end
  end

end