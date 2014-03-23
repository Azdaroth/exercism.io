require 'date'

class Clock

  DAY_IN_HOURS = 24.0
  DAY_IN_MINUTES =  1440.0

  def self.at(hours, minutes=0)
    new(
      add_minutes(
        add_hours(Date.today.to_datetime, hours),
        minutes)
      )
  end

  attr_reader :time
  private :time

  def initialize(time)
    @time = time
  end
  
  def +(minutes)
    new(time + (minutes / DAY_IN_MINUTES))    
  end

  def -(minutes)
    new(time - (minutes / DAY_IN_MINUTES))
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end
 
  def to_s
    time.strftime("%H:%M")
  end

  private

    def self.add_hours(datetime, hours)
      datetime + (hours / DAY_IN_HOURS)
    end

    def self.add_minutes(datetime, minutes)
      datetime + (minutes / DAY_IN_MINUTES)
    end

    def new(new_time)
      self.class.new(new_time)
    end

end