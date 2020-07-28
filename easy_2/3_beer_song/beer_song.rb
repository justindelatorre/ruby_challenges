=begin
https://launchschool.com/exercises/0146ea42
=end

class BeerSong
  def initialize
    @output = ''
  end

  def verses(start_at, end_at)
    get_output(start_at, end_at)
  end

  def verse(start_at)
    end_at = start_at
    verses(start_at, end_at)
  end

  def lyrics
    verses(99, 0)
  end

  # private

  def get_output(start_at, end_at)
    counter = start_at
    while counter >= end_at
      @output << get_verse(counter)
      @output << "\n" if counter != end_at
      counter -= 1
    end

    @output
  end

  def get_verse(counter)
    if counter > 2
      more_than_two_bottles(counter)
    elsif counter == 2
      two_bottles_left
    elsif counter == 1
      one_bottle_left
    else
      no_bottles_left
    end
  end

  def more_than_two_bottles(counter)
    "#{counter} bottles of beer on the wall, "\
    "#{counter} bottles of beer.\n" \
    "Take one down and pass it around, "\
    "#{counter - 1} bottles of beer on the wall.\n"
  end

  def two_bottles_left
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def one_bottle_left
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def no_bottles_left
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
