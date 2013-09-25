class Phone

  attr_reader :phone_number
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    converter.to_phone_number
  end

  def area_code
    first_three_digits
  end

  def middle_part
    number[3..5]
  end

  def last_part
    number[6..9]
  end

  def to_s
    "(#{area_code}) #{middle_part}-#{last_part}"
  end

  private

    def converter
      @converter ||= Converter.new(phone_number)
    end

    def first_three_digits
      number[0..2]
    end
end

class Converter
  
  attr_reader :number
  def initialize(input)
    @number = take_digits(input)
  end

  def to_phone_number
    case 
    when phone_number_too_long? || phone_number_too_short?
      invalid_phone_number
    when phone_number_with_one_first?
      phone_number_with_first_one_omitted
    else
      number
    end
  end

  private

    def take_digits(input)
      input.scan(/\d/).join
    end

    def invalid_phone_number
      "0000000000"
    end

    def phone_number_too_long?
      number.length > 10 and number.chars.first != "1"
    end

    def phone_number_too_short?
      number.length < 10
    end

    def phone_number_with_one_first?
      number.length > 10 and number.chars.first == "1"
    end

    def phone_number_with_first_one_omitted
      number[1..-1]
    end

end