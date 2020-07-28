=begin
https://launchschool.com/exercises/997ac42a

NOTE: Tests pass, but need to seriously re-factor.
=end

class SecretHandshake
  def initialize(value)
    @value = convert_to_binary(value)
  end

  def commands
    return @value if @value == []
    counter = @value.to_i
    reverse = false
    if reverse?
      counter -= 10_000
      reverse = true
    end

    commands_arr = []

    while counter > 0
      if counter >= 1_000
        commands_arr << 'jump'
        counter -= 1_000
      elsif counter >= 100
        commands_arr << 'close your eyes'
        counter -= 100
      elsif counter >= 10
        commands_arr << 'double blink'
        counter -= 10
      elsif counter == 1
        commands_arr << 'wink'
        counter -= 1
      end 
    end
 
    reverse? ? commands_arr : commands_arr.reverse
  end

  private

  def convert_to_binary(val)
    return [] if !valid_value?(val)
    return val if val.class == String
    val.to_s(2).to_i
  end

  def valid_value?(val)
    val.to_s.each_char do |char|
      return false if char != char.to_i.to_s
    end

    true
  end

  def reverse?
    @value.to_i >= 10_000
  end
end
