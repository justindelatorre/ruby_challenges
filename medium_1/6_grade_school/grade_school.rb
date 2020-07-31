=begin
https://launchschool.com/exercises/a8a8db78
=end

class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    if @students[grade]
      @students[grade] << name
      @students[grade].sort!
    else
      @students[grade] = [name]
    end
  end

  def grade(grade)
    return [] if !@students.keys.include?(grade)
    @students.fetch(grade)
  end

  def to_h
    @students.sort.to_h
  end
end

# school = School.new
# school.add('Kyle', 3)
# school.add('Aimee', 2)
# p school.to_h
# p school.to_h.keys
# p school.grade(1)
