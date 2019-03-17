class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Define User Data
    if user_signed_in?
      @events = TimeOff.where('end_date > ?', Date.today).all
    end
  end
end
