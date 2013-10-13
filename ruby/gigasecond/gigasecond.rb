class Gigasecond
  
  GIGASECOND = 1_000_000_000
  DAY_IN_SECONDS = 60 * 60 * 24
  GIGASECOND_TO_DAYS = GIGASECOND / DAY_IN_SECONDS

  def initialize(start_date)
    @start_date = start_date
  end

  def date
    @start_date + GIGASECOND_TO_DAYS
  end

end