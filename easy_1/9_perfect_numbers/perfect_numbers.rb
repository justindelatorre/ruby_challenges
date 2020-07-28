=begin
https://launchschool.com/exercises/0875e53f
=end
require 'prime'

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0

    sum_of_factors = (1...num).to_a.select { |n| (num % n).zero? }.sum

    if sum_of_factors == num
      return 'perfect'
    elsif sum_of_factors > num
      return 'abundant'
    else
      return 'deficient'
    end
  end
end
