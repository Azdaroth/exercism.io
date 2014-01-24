class Triangle(object):
  
    def __init__(self, a, b ,c):
        self.a = a 
        self.b = b 
        self.c = c 
        if not self._validate():
            raise TriangleError

    def kind(self):
        for kind, result in self._kinds.items():
            if kind():
                return result
        else: 
            return "scalene"

    def is_equilateral(self):
        return len(set(self._sides)) == 1

    def is_isosceles(self):
        return len(set(self._sides)) == 2

    def _validate(self):
        return abs(self.a - self.c) < self.b and self.b < self.a + self.c

    @property
    def _kinds(self):
        return {
            self.is_equilateral: "equilateral",
            self.is_isosceles: "isosceles"
        }

    @property
    def _sides(self):
        return [self.a, self.b, self.c]
    

class TriangleError(Exception):
  
    def __init__(self):
        pass