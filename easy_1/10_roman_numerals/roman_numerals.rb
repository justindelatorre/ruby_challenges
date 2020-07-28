=begin
https://launchschool.com/exercises/23ed6a7d
=end

class Integer
  def to_roman
    value = self
    roman = ''

    while value > 0
      if value >= 1000
        roman << 'M'
        value -= 1000
      elsif (900..999).include?(value)
        roman << 'CM'
        value -= 900
      elsif (500..899).include?(value)
        roman << 'D'
        value -= 500
      elsif (400..499).include?(value)
        roman << 'CD'
        value -= 400
      elsif (100..399).include?(value)
        roman << 'C'
        value -= 100
      elsif (90..99).include?(value)
        roman << 'XC'
        value -= 90
      elsif (50..89).include?(value)
        roman << 'L'
        value -= 50
      elsif (40..49).include?(value)
        roman << 'XL'
        value -= 40
      elsif (10..39).include?(value)
        roman << 'X'
        value -= 10
      elsif value == 9
        roman << 'IX'
        value -= 9
      elsif (5..8).include?(value)
        roman << 'V'
        value -= 5
      elsif value == 4
        roman << 'IV'
        value -= 4
      else
        roman << 'I'
        value -= 1
      end
    end

    roman
  end
end
