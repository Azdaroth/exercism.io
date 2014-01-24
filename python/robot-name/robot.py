import string
import random

class Robot(object):

    USED_NAMES = []
  
    def __init__(self):
        self._name = self._generate_name()
  
    @property
    def name(self):
        if self._name:
            return self._name 
        else:
            return self._generate_name()

    def reset(self):
        self.USED_NAMES.remove(self._name)
        self._name = None

    def _generate_name(self):
        name = NamesFactory().generate(2, 3)
        if name in self.USED_NAMES:
            self._generate_name()
        else:
            self.USED_NAMES.append(name)
            return name


class NamesFactory(object):
    
    def __init__(self):
        pass

    def generate(self, letters_number, digits_number):
        return self._random_letters(letters_number) + self._random_digits(digits_number)

    def _random_letters(self, number):
        return "".join([random.choice(string.ascii_uppercase) for x in range(number)])

    def _random_digits(self, number):
        return "".join([random.choice(string.digits) for x in range(number)])
        




