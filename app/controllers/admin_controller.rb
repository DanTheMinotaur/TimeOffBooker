require 'calendarific_api'

class AdminController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def populate
    public_holidays = CalendarificAPI.new 'f84730195f8c53e3f602074389c0f5824800a5b3'
    @holidays = public_holidays.get('IE', Date.today.year)
  end

  def populate_holidays
    @holidays_added = 0
    if params.key? :holidays
      public_holidays = params[:holidays].to_a

      public_holidays.each_with_index do |holiday, index|
        values = holiday.split('|')
        begin
          if Holiday.create(holiday_date: values[0], reason: values[1])
            @holidays_added += 1
          end
        rescue ActiveRecord::RecordNotUnique => e
          next
        end
      end
    end
    redirect_to Holiday
  end
end
