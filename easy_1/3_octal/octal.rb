=begin
https://launchschool.com/exercises/09b0d367
=end

class Octal
  def initialize(value)
    @value = value
  end

  def to_decimal
    digits = @value.chars.map do |char|
               return 0 if (char.to_i).zero? && char != '0' || char.to_i > 7
               char.to_i
             end
    counter = @value.size - 1
    conversion = 0

    digits.each do |digit|
      conversion += digit * (8 ** counter)
      counter -= 1
    end

    conversion
  end
end
