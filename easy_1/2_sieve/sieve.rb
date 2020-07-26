=begin
https://launchschool.com/exercises/ca16ce9f
=end

class Sieve
  def initialize(up_to_num)
    @up_to_num = up_to_num
    @start_num = 2
    @map_hsh = find_composites
  end

  def primes
    @map_hsh.select { |k, v| v == :prime }.keys
  end

  private

  def setup_map
    (@start_num..@up_to_num).each_with_object({}) do |n, hsh|
      hsh[n] = :prime
    end
  end

  def find_composites
    hsh = setup_map

    hsh.keys.each do |current_key|
      next if hsh[current_key] == :composite

      hsh.keys.each do |comparison|
        next if comparison == current_key
        hsh[comparison] = :composite if (comparison % current_key).zero?
      end
    end

    hsh
  end
end
