=begin
https://launchschool.com/exercises/506e9823

Consider a character set consisting of letters, a space, and a point. Words
consist of one or more, but at most 20 letters. An input text consists of one
or more words separated from each other by one or more spaces and terminated by
0 or more spaces followed by a point. Input should be read from, and including,
the first letter of the first word, up to and including the terminating point.
The output text is to be produced such that successive words are separated by a
single space with the last word being terminated by a single point. Odd words
are copied in reverse order while even words are merely echoed. For example,
the input string:

"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS: The characters must be read and printed one at a time.
=end

=begin
Problem:
Given a character set (which feels like a sentence), reverse every word at an
odd index position.

Example:
"whats the matter with kansas." becomes "whats eht matter htiw kansas."

Data Structures:
- Input: String
- Output: String
- Intermediate: Array, for traversing through characters in String

Rules:
- Explicit:
  - Reverse the characters for every odd-indexed word.

- Implicit:
  - Raise ArgumentError if a character in the set is non-alphabetic.
  - Individual characters should retain their original case.

Clarifications / Potential Test Cases:
- How should invalid inputs be treated?
  - Raise ArgumentError if a character is non-alphabetic
- Should characters retain their original case?
  - Yes.

Algorithm:
- Split argument String into word Array
- Initialize target Array
- Loop through word Array:
  - If index of word is odd, reverse the word:
    - If word contains a point, remove point, reverse word, then affix same
      point
- Return joined word Array
 
=end

class OddWord
  def initialize(character_set)
    @character_set = character_set
  end

  def reverse_odds
    words = @character_set.split

    words.map.with_index do |word, idx|
      if idx.odd?
        reversed = if word.match(/\./)
                     word.gsub(/\./, '').chars.reverse.join + '.'
                   else
                     word.chars.reverse.join
                   end
      else
        reversed = word
      end

      reversed
    end.join(' ')
  end
end

odd_word = OddWord.new("whats the matter with kansas.")
p odd_word.reverse_odds == "whats eht matter htiw kansas." 
