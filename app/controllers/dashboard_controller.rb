class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Define User Data
    if user_signed_in?
      @events = TimeOff.joins(:user).where('end_date > ?', Date.today).all.order(start_date: :asc)
    end

    if params.has_key? :time_off
      time_off_data = params[:time_off]

      TimeOff.create(
          {user_id: current_user.id,
           start_date: Date.strptime(time_off_data[:start_date], '%m/%d/%Y'),
           end_date: Date.strptime(time_off_data[:end_date], '%m/%d/%Y'),
           off_type: time_off_data[:off_type].to_i
          }
      )
    end
  end


  # Handles requests being made to managers or employee made requests.
  def requests
    if current_user.user_level == 'admin'
      @requests = TimeOff.joins(:user).where('approved == false AND end_date > ?', Date.today).all.order(start_date: :asc)
    elsif current_user.user_level == 'manager'
      @requests = nil
    elsif current_user.user_level == 'employee'
      @requests = TimeOff.joins(:user).where('user_id = ?', current_user.id).all.order(start_date: :asc)
    end
  end
end
