require File.expand_path('../../config/environment',  __FILE__)
require '../app/models/time_off'

class HolidayCalulator
  def initialize(start_date, end_date, holidays = [])
    calculate_total_days(start_date, end_date, holidays)
  end

  def calculate_total_days(start_date, end_date, holidays)
    holiday_count = 0
    start_date.upto(end_date) do |date|
      if !date.sunday? || !date.saturday?
        unless holidays.empty?
          if holidays.include? date
            next
          end
        end
        holiday_count += 1
      end

      puts date
    end
    holiday_count
  end
end

dates = TimeOff.find(1)

puts(dates['start_date'].class)

obj = HolidayCalulator.new(dates['start_date'], dates['end_date'], [Date.new(2019, 03, 20)])

puts obj