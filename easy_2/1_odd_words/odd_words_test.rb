=begin
https://launchschool.com/exercises/506e9823
=end

require 'minitest/autorun'
require_relative 'odd_words'

class OddWordTest < MiniTest::Test
  def test_reverse_odds
    odd_word = OddWord.new('hello world')
    assert_equal('hello dlrow', odd_word.reverse_odds)
  end

  def test_reverse_odds_does_not_reverse_evens
    odd_word = OddWord.new('hello')
    assert_equal('hello', odd_word.reverse_odds)
  end

  def test_reverse_odds_retains_case
    odd_word = OddWord.new('Hello World')
    assert_equal('Hello dlroW', odd_word.reverse_odds)
  end

  def test_reverse_odd_considers_terminating_point
    odd_word = OddWord.new('whats the matter with kansas city.')
    assert_equal('whats eht matter htiw kansas ytic.', odd_word.reverse_odds)
  end
end
