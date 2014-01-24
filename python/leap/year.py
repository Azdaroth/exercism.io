class Year(object):
  
    def __init__(self, year):
        self.year = year

    def is_leap_year(self):
        return self._is_divisble_by(4) and not self._is_divisble_by(100) or self._is_divisble_by(400)

    def _is_divisble_by(self, num):
        return self.year % num == 0


    
