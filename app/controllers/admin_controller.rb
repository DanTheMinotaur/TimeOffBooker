require 'calendarific_api'

class AdminController < ApplicationController
  def users
    @users = User.all
  end

  def populate
    public_holidays = CalendarificAPI.new 'f84730195f8c53e3f602074389c0f5824800a5b3'
    @holidays = public_holidays.get('IE', '2019')
  end
end
