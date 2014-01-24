from collections import defaultdict

class School(object):

    def __init__(self, name):
        self.name = name
        self.db = defaultdict(set)

    def add(self, student, grade):
        self.db[grade].add(student)

    def grade(self, grade):
        return self.db[grade]

    def sort(self):
        return {
            grade: tuple(students)
            for grade, students in sorted(self.db.iteritems())
        }
        