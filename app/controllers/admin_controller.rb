require 'calendarific_api'
require 'employee_builder'

class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def users
    @users = User.all
  end

  def add_user
    if params.key? :user_details
      user_details = params[:user_details]
      user = EmployeeBuilder.new
      user.password user_details[:password]
      user.email user_details[:email]
      user.user_level user_details[:user_level].to_i
      user.name user_details[:name]
      user.job_title user_details[:job_title]
      user.total_days user_details[:days_off]

      if User.create(user.for_model)
        @user_created = "#{user_details[:name]} was created successfully"
      else
        @user_created = "Could not create user..."
      end
    end
  end

  def permission
    ##
    # Handles when admin wants to assign permissions to a mangager
    if params.key? :manager_id
      @permissions = {}
      @permissions['manager'] = User.select("name, id").where("id = #{params[:manager_id].to_i}").as_json
      @permissions['users'] = User.select("*").joins("LEFT JOIN approvals ON users.id = approvals.user_id").where('user_level = 1').as_json
    else
      @mangers = User.where('user_level = 2').as_json
    end
  end

  def grant_permissions
    ##
    # Method adds user permissions to managers
    if params.key? :permissions and params.key? :manager_id
      manager_id = params[:manager_id].to_i
      permissions = params[:permissions].to_a
      permissions_added_count = 0
      permissions.each do |user_id|
        begin
          if Approval.create({manager_id: manager_id, user_id: user_id.to_i})
            permissions_added_count += 1
          end
        rescue ActiveRecord::RecordNotUnique => e
          next
        end
      end
    end
    flash[:notice] = "#{permissions_added_count} new uses have been assigned"
    render action: "index"
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
