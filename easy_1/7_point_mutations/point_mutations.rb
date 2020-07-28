=begin
https://launchschool.com/exercises/b94c1dcb
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    len = @strand.size > other_strand.size ? other_strand.size : @strand.size
    counter = 0

    0.upto(len - 1) do |n|
      counter += 1 if @strand[n] != other_strand[n]
    end

    counter
  end
end
