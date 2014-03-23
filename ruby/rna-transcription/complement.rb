module Complement

  extend self

  def of_dna(nucleotides)
    transcribe nucleotides, with: :rna_pairs
  end

  def of_rna(nucleotides)
    transcribe nucleotides, with: :dna_pairs
  end

  private

    def transcribe(nucleotides, args)
      pairs = args.fetch(:with)
      nucleotides.chars.map do |nucleotide|
        send(pairs).fetch(nucleotide)
      end.join   
    end

    def dna_pairs
      {
        "A" => "T",
        "U" => "A",
        "C" => "G",
        "G" => "C"
      }
    end

    def rna_pairs
      {
        "G" => "C",
        "C" => "G",
        "T" => "A",
        "A" => "U"
      }
    end
  
end