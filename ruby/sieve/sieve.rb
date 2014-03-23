class Sieve
  
  attr_reader :limit
  private :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes ||= calculate_primes
  end

  private

    def calculate_primes
      range = (2..limit).to_a
      range.each_with_object([]) do |current_number, numbers|
        numbers << current_number
        range.reject! { |number| number % current_number == 0 and number > current_number  }
      end
    end

end