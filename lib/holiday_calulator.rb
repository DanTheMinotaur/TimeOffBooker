# require File.expand_path('../../config/environment',  __FILE__)
# require '../app/models/time_off'

class HolidayCalulator
  ##
  # Class for calculating total holidays
  # @param start_data: The date that the holiday period starts
  # @param end_date: The date that the holiday period ends
  # @param start_data: The date that the holiday period starts
  # @param holidays[]: array of holidays that are already off
  def initialize(start_date, end_date, holidays = [])
    @total_days = calculate_total_days(start_date, end_date, holidays)
  end

  def total_days
    # getter for returning holidays
    @total_days
  end

  def calculate_total_days(start_date, end_date, holidays)
    ##
    # Method calulates the number of days that are being taken off.
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