require 'news_api'

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Define User Data
    if user_signed_in?
      @events = TimeOff.joins(:user).where('end_date > ?', Date.today).all.order(start_date: :asc)
    end
  end

  def request_time_off
    if params.key? :time_off
      time_off_data = params[:time_off]

      data_to_add = {
          user_id: current_user.id,
          start_date: Date.strptime(time_off_data[:start_date], '%m/%d/%Y'),
          end_date: Date.strptime(time_off_data[:end_date], '%m/%d/%Y'),
          off_type: time_off_data[:off_type].to_i
      }

      if TimeOff.create(data_to_add)
        respond_to do |format|
          format.json { render json: "Your request for a time off has been sent to be approved "}
        end
      end
    end
  end

  def news
    newsapi = NewsAPI.new 'e559847227d34d69b34f8f53cc73c7fe'

    @news_data = newsapi.get('business', {
        'from': '2019-02-28',
        'sortBy': 'popularity'
    })

  end

  # Handles requests being made to managers or employee made requests.
  def requests
    @user_own_requests = TimeOff.joins(:user).where('user_id = ?', current_user.id).all.order(start_date: :asc)
    if is_admin?
      @to_be_approved_requests = TimeOff.joins(:user).where('approved IS NULL AND end_date > ?', Date.today).all.order(start_date: :asc)
    end
  end

  def approve_time_off
    if params.key? :request

      request = params[:request]

      time_off = TimeOff.find(request['request_id'].to_i)

      if time_off.update(approved: request['approval'].to_i, approved_by: request['manager_id'].to_i)
        respond_to do |format|

          format.json { render json: generate_ajax_response('approval', request['request_id'].to_i) }
        end
      end
    end
  end
end
