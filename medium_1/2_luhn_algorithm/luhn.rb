=begin
https://launchschool.com/exercises/b3d4e236
=end

class Luhn
  def initialize(value)
    @value = value
    @digits = value.digits.reverse
  end

  def addends
    self.class.addends(@digits)
  end

  def checksum
    self.class.checksum(self.addends)
  end

  def valid?
    self.class.valid?(@value)
  end

  def self.create(number)
    digits = number.digits.reverse
    (0..9).each do |n|
      test_digits = digits.clone
      test_digits << n
      if self.valid?(test_digits.join.to_i)
        digits << n
        break
      end
    end
    digits.join.to_i
  end

  private

  def self.addends(digits)
    digits.reverse.map.with_index do |digit, idx|
      if idx.odd?
        (digit * 2) < 10 ? digit * 2 : (digit * 2) - 9      
      else
        digit
      end
    end.reverse
  end

  def self.checksum(addends)
    addends.sum
  end

  def self.valid?(number)
    digits = number.digits.reverse
    checksum = self.checksum(self.addends(digits))
    checksum.digits.reverse[-1].zero?
  end
end
