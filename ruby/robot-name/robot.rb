class Robot
  
  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  private

    def generate_name
      random_two_letters + random_three_digits
    end

    def random_two_letters
      [*('A'..'Z')].sample(2).join
    end

    def random_three_digits
      rand.to_s[2..4]
    end

end