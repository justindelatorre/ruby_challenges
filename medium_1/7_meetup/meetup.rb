=begin
https://launchschool.com/exercises/c54f19b9
=end

require 'date'

class Meetup
  WEEKDAYS = {
    sunday: 0, monday: 1, tuesday: 2, wednesday: 3,
    thursday: 4, friday: 5, saturday: 6
  }.freeze

  def initialize(month, year)
    @mon = month
    @year = year
    @date_ranges = {
      teenth: 12..18,
      first:  0..6,
      second: 7..13,
      third:  14..20,
      fourth: 21..27,
      last: 0..6
    }.freeze
  end

  def day(weekday, schedule)
    if schedule == :last
      calculate_last_date(weekday, schedule)
    else
      calculate_non_last_date(weekday, schedule)
    end
  end

  def get_month_range
    (Date.new(@year, @mon, 1)..Date.new(@year, @mon, 1).next_month.prev_day).to_a
  end

  def calculate_last_date(weekday, schedule)
    last_day = Date.new(@year, @mon, 1).next_month.prev_day
    dates = (@date_ranges[schedule]).to_a.map do |n|
              Date.new(@year, @mon, last_day.day - n)
            end
    dates.select { |date| date.wday == WEEKDAYS[weekday] }.first
  end

  def calculate_non_last_date(weekday, schedule)
    range = get_month_range
    dates = range.select { |date| date.public_send(weekday.to_s + '?') }
    dates.select { |date| @date_ranges[schedule].include?(date.day - 1) }.first
  end
end
