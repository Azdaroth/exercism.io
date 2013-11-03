import re
class Phone(object):
  
    _INVALID_NUMBER = "0" * 10 

    def __init__(self, number_candidate):
        self.number_candidate = re.sub("[^0-9]", "", number_candidate)

    @property
    def number(self):        
        for condition, response in self._responses.items():
            if condition(): 
                return response
        else:
            return self.number_candidate

    def area_code(self):
        return self.number[0:3]

    def pretty(self):
        prettified_area_code = "(%s)" % self.area_code()
        return "%s %s-%s" % (prettified_area_code, self._number_middle_part,
            self._number_last_part)

    def _is_valid_with_excessive_one(self):
        return len(self.number_candidate) == 11 and self.number_candidate[0] == "1"

    def _is_invalid(self):
        return len(self.number_candidate) != 10

    @property
    def _responses(self):
        return {
            self._is_valid_with_excessive_one: self.number_candidate[1:],
            self._is_invalid: self._INVALID_NUMBER
        }

    @property
    def _number_middle_part(self):
        return self.number[3:6]

    @property
    def _number_last_part(self):
        return self.number[6:]