=begin
https://launchschool.com/exercises/61f7f314
=end

class PhoneNumber
  INVALID_NUMBER = %w(0 0 0 0 0 0 0 0 0 0).freeze

  def initialize(number_str)
    @number_str = number_str
    @digits = get_digits
  end

  def number
    digits = if wrong_digits_length? ||
                letter_included? || 
                eleven_digits_no_leading_one?
               INVALID_NUMBER
             else
               get_digits
             end

    digits.size == 10 ? digits.join : digits[1..10].join
  end

  def area_code
    ten_digits_long? ? number[0..2] : number[1..3]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def get_digits
    @number_str.each_char.select do |char|
      char.to_i.to_s == char
    end.map(&:to_i)
  end

  def ten_digits_long?
    @digits.size == 10
  end

  def wrong_digits_length?
    @digits.size < 10 || @digits.size > 11
  end

  def letter_included?
    @number_str.match(/[a-zA-Z]/)
  end

  def eleven_digits_no_leading_one?
    @digits.size == 11 && @digits.first != 1 
  end
end
