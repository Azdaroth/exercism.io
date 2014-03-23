class Allergies
  
  attr_reader :score, :all_allergies, :scores, :scores_allergies_mapping
  private :score, :all_allergies, :scores, :scores_allergies_mapping

  def initialize(score)
    @score = score
    @all_allergies = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
    @scores = %w[1 2 4 8 16 32 64 128].map(&:to_i)
    @scores_allergies_mapping = scores.zip(all_allergies).to_h
  end

  def list
    current_scores = score
    available_scores = score % limit

    allergies = []

    while (available_scores > 0)

      if scores.include?(current_scores) and (available_scores - current_scores >= 0)
        available_scores -= current_scores
        allergies << scores_allergies_mapping[current_scores]
      end

      current_scores -= 1

    end
    allergies.reverse
  end

  def allergic_to?(allergy)
    list.include? allergy
  end

  private

    def limit
      scores.reduce(0, :+) + 1
    end

end