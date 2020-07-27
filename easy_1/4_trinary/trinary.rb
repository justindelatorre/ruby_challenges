=begin
https://launchschool.com/exercises/a74a58d6
=end

class Trinary
  def initialize(value)
    @value = value
  end

  def to_decimal
    int_arr = @value.chars.map do |char|
                return 0 if (char.to_i).zero? && char != '0' || char.to_i > 2
                char.to_i
              end
    counter = @value.size - 1
    conversion = 0

    int_arr.each do |digit|
      conversion += digit * (3 ** counter)
      counter -= 1      
    end

    conversion
  end
end
