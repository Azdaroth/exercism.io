from datetime import date
from datetime import timedelta

class Gigasecond(object):
  
    def __init__(self, start_date):
        self.start_date = start_date
    
    @property
    def date(self):
        return self.start_date + timedelta(seconds=1000000000)