class SpaceAge
  
  EARTH_YEAR_DURATION = 31557600

  PLANETS_WITH_YEAR_DURATION = { 
    mercury: EARTH_YEAR_DURATION * 0.2408467,
    venus:   EARTH_YEAR_DURATION * 0.61519726,
    earth:   EARTH_YEAR_DURATION,
    mars:    EARTH_YEAR_DURATION * 1.8808158,
    jupiter: EARTH_YEAR_DURATION * 11.862615,
    saturn:  EARTH_YEAR_DURATION * 29.447498,
    uranus:  EARTH_YEAR_DURATION * 84.016846,
    neptune: EARTH_YEAR_DURATION * 164.79132
   }.freeze


  PLANETS_WITH_YEAR_DURATION.each do |planet, year_duration|
    define_method "on_#{planet}" do 
      (seconds.to_f / year_duration).round(2)
    end
  end

  attr_reader :seconds
  def initialize(seconds)
    @seconds = seconds
  end

end