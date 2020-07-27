=begin
https://launchschool.com/exercises/2fc03016
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.select do |element|
      @word.downcase.chars.sort == element.downcase.chars.sort &&
        @word.downcase != element.downcase
    end
  end
end
