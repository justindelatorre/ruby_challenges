=begin
https://launchschool.com/exercises/affefe14
=end

class Scrabble
  VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G)                 => 2,
    %w(B C M P)             => 3,
    %w(F H V W Y)           => 4,
    %w(K)                   => 5,
    %w(J X)                 => 8,
    %w(Q Z)                 => 10
  }.freeze

  def self.score(word)
    return 0 if word.nil?
    upcased_word = word.upcase
    total = 0

    upcased_word.chars.each do |char|
      VALUES.each do |k, v|
        total += v if k.include?(char)
      end
    end

    total
  end

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end
end
