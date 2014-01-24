class SpaceAge(object):
  
    _DAY_IN_SECONDS = 24 * 3600
    _ORBITAL_PERIOD_IN_DAYS = 365.25

    def __init__(self, seconds):
        self.seconds = seconds
        self._seconds_to_earth_years = self.seconds / (self._DAY_IN_SECONDS * self._ORBITAL_PERIOD_IN_DAYS)

    def on_earth(self):
        return self._calculate(1)

    def on_mercury(self):
        return self._calculate(0.2408467)

    def on_venus(self):
        return self._calculate(0.61519726)

    def on_mars(self):
        return self._calculate(1.8808158)

    def on_jupiter(self):
        return self._calculate(11.862615)

    def on_saturn(self):
        return self._calculate(29.447498)

    def on_uranus(self):
        return self._calculate(84.016846)

    def on_neptune(self):
        return self._calculate(164.79132)

    def _calculate(self, earth_relative_divisor):
        return round((self._seconds_to_earth_years / earth_relative_divisor), 2)