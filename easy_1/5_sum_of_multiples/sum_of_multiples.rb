=begin
https://launchschool.com/exercises/780205f1
=end

class SumOfMultiples
  def self.to(num, values = [3, 5])
    (0...num).select do |n|
      values.any? { |value| (n % value).zero? }    
    end.reduce(:+)
  end

  def initialize(*values)
    @values = values
  end

  def to(num)
    self.class.to(num, @values)
  end
end
