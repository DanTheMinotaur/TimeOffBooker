require 'news_api'
require 'holiday_calulator'

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Define User Data
    if user_signed_in?
      @events = TimeOff.joins(:user).where('end_date > ?', Date.today).all.order(start_date: :asc)
    end
  end

  def request_time_off
    # Handles Holiday Booking Requests calculates number of days user is taking,
    if params.key? :time_off
      time_off_data = params[:time_off]
      data_to_add = {
          user_id: current_user.id,
          start_date: Date.strptime(time_off_data[:start_date], '%m/%d/%Y'),
          end_date: Date.strptime(time_off_data[:end_date], '%m/%d/%Y'),
          off_type: time_off_data[:off_type].to_i
      }

      company_holidays = Holiday.pluck(:holiday_date)

      holiday = HolidayCalulator.new(data_to_add[:start_date], data_to_add[:end_date], company_holidays)
      data_to_add['days_taken'] = holiday.total_days

      if TimeOff.create(data_to_add)
        respond_to do |format|
          #format.json { render json: generate_ajax_response('request','request-received')}
          format.json { render json: generate_ajax_response('request',data_to_add)}
        end
      end
    end
  end

  def news
    # Controls new data being recieved from newsapi.org
    newsapi = NewsAPI.new 'e559847227d34d69b34f8f53cc73c7fe'

    @news_data = newsapi.get(Company.instance.news_term, {
        'from': '2019-02-28',
        'sortBy': 'popularity'
    })

  end


  def requests
    # Handles requests being made to managers or employee made requests.
    user_id = current_user.id
    @user_own_requests = TimeOff.joins(:user).where('user_id = ?', user_id).all.order(start_date: :asc)
    if is_admin?
      @to_be_approved_requests = TimeOff.joins(:user).where('approved IS NULL AND end_date > ?', Date.today).all.order(start_date: :asc)
    elsif is_manager?
      @to_be_approved_requests = TimeOff.joins(:user).where('approved IS NULL AND end_date > ?', Date.today).all.order(start_date: :asc)
    end
  end

  def view_requests
    # Shows requests from specific users
    if params.key? :user_requests_id
      user_lookup_id = params[:user_requests_id]

      @user_times_off = TimeOff.joins(:user).where('user_id = ?', user_lookup_id).order(start_date: :asc)
    end
  end

  def approve_time_off
    # Handles time off approvals
    if params.key? :request

      request = params[:request]

      time_off = TimeOff.find(request['request_id'].to_i)

      if time_off.update(approved: request['approval'].to_i, approved_by: request['manager_id'].to_i)
        user = User.find(time_off.user_id)
        current_days = user.days_taken
        current_days += time_off.days_taken
        user.update(days_taken: current_days)
        respond_to do |format|

          format.json { render json: generate_ajax_response('approval', request['request_id'].to_i) }
        end
      end
      end
  end
end
