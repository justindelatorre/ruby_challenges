=begin
https://launchschool.com/exercises/0b445a57
=end

class PigLatin
  def self.translate(phrase)
    words = phrase.split

    arr = words.map do |word|
            self.apply_pig_latin(word)
          end

    arr.size > 1 ? arr.join(' ') : arr.join
  end

  private

  def self.apply_pig_latin(word)
    length = word.size - 1
    if self.three_letter_rule?(word)
      word[3..length] + word[0..2] + 'ay'
    elsif self.two_letter_rule?(word)
      word[2..length] + word[0..1] + 'ay'
    elsif self.other_rules?(word)
      word + 'ay'
    elsif self.one_letter_rule?(word)
      word[1..length] + word[0] + 'ay'
    else
      word + 'ay'
    end
  end

  def self.three_letter_rule?(word)
    word.match(/^sch|thr|[a-z]{1}qu/) 
  end

  def self.two_letter_rule?(word)
    word.match(/^ch|qu|th/) 
  end

  def self.one_letter_rule?(word)
    word.match(/^[^aeiou]{1}/)
  end

  def self.other_rules?(word)
    word.match(/^xr|yt/)
  end
end
