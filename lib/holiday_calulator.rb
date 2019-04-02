require File.expand_path('../../config/environment',  __FILE__)
require '../app/models/time_off'

class HolidayCalulator
  ##
  # Class for calculating total holidays
  def initialize(start_date, end_date, holidays = [])
    @total_days = calculate_total_days(start_date, end_date, holidays)
  end

  def total_days
    # getter for returning holidays
    @total_days
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
    end
    holiday_count
  end
end

dates = TimeOff.find(1)

obj = HolidayCalulator.new(dates['start_date'], dates['end_date'], [Date.new(2019, 03, 20), Date.new(2019, 03, 19)])

puts obj.total_days