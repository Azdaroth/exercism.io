class Meetup

  DAYS = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"].freeze
  NUMERALS = ["first", "second", "third", "fourth"].freeze
  
  DAYS.each do |day|
    teenth_day_name = day.sub('day', 'teenth')
    define_method "#{teenth_day_name}" do
      teenth_day_for_month(day)
    end
  end

  NUMERALS.each_with_index do |numeral, occurence|
    DAYS.each do |day|
      define_method "#{numeral}_#{day}" do
        days_for_month(day)[occurence]
      end
    end
  end

  DAYS.each do |day|
    define_method "last_#{day}" do
      days_for_month(day).last
    end
  end

  attr_reader :month, :year
  def initialize(month, year)
    @month = month
    @year = year
  end

  private

    def dates_for_month
      Date.new(year, month, 1)..Date.new(year, month, -1)
    end

    def teenth_day_for_month(day_name)
      days_for_month(day_name).find { |date| date.day.between?(13, 19) }
    end

    def days_for_month(day_name)
      dates_for_month.select(&:"#{day_name}?")
    end

end
