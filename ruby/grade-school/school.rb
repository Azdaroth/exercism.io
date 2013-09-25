class School
  
  attr_reader :name, :db
  def initialize(name)
    @name = name
    @db = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(student, grade)
    db[grade] << student
  end

  def grade(num)
    db[num]
  end

  def sort
    Hash[with_sorted_students.sort]
  end

  private

    def with_sorted_students
      db.map { |grade, students| [grade, students.sort] }
    end

end
