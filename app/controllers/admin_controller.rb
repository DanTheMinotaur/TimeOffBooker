require 'calendarific_api'

class AdminController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def permission
    if params.key? :manager_id
      @permissions = {}
      @permissions['manager'] = User.select("name, id").where("id = #{params[:manager_id].to_i}").as_json
      @permissions['users'] = User.select("*").joins("LEFT JOIN approvals ON users.id = approvals.user_id").where('user_level = 1').as_json
    else
      @mangers = User.where('user_level = 2').as_json
    end
  end

  def grant_permissions
    if params.key? :permissions and params.key? :manager_id
      manager_id = params[:manager_id].to_i
      permissions = params[:permissions].to_a
      permissions.each do |user_id|
        Approval.create({manager_id: manager_id, user_id: user_id.to_i})
      end
    end
    redirect_to index
  end

  def populate
    # Shows Admin what holidays to populate
    public_holidays = CalendarificAPI.new 'f84730195f8c53e3f602074389c0f5824800a5b3'
    @holidays = public_holidays.get(Company.instance.country, Date.today.year)
  end

  def populate_holidays
    # Populates chosen holidays that admin has selected
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
