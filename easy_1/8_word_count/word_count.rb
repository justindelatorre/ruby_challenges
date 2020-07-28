=begin
https://launchschool.com/exercises/e060c934
=end

class Phrase
  def initialize(str)
    @str = str
    @words = @str.gsub(/[^\w']/, ' ').split
  end

  def word_count
    @words.each_with_object({}) do |word, hsh|
      if hsh[word.downcase]
        hsh[word.downcase] += 1
      else
        hsh[word.downcase] = 1
      end
    end
  end
end
