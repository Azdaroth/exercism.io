# from the previous one
require './prime_factors'

class Raindrops

  def convert(number)
    factors = unique_factors(number)
    if any_factor_raindroppable?(factors)
      transform_to_sounds(factors)
    else
      number.to_s
    end
  end

  private

    def raindroppables
      [3, 5, 7]
    end

    def any_factor_raindroppable?(factors)
      factors.any? { |factor| raindroppable?(factor) }
    end

    def raindroppable?(number)
      raindroppables.any? { |raindroppable_number| raindroppable_number == number  }
    end

    def dropsound(number)
      case number
      when 3 then "Pling"
      when 5 then "Plang"
      when 7 then "Plong"
      end
    end

    def unique_factors(number)
      @unique_factors ||= PrimeFactors.for(number).uniq
    end

    def transform_to_sounds(factors)
      factors.map do |factor|
        dropsound(factor) if raindroppable?(factor)
      end.join 
    end

end