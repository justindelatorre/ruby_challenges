=begin
https://launchschool.com/exercises/3db163fb
=end

class Series
  def initialize(num_str)
    @num_str = num_str
  end

  def slices(length)
    raise(ArgumentError, 'length is too long') if length > @num_str.size

    @num_str.chars.each_cons(length).map do |series|
      series.map(&:to_i)
    end  
  end
end
