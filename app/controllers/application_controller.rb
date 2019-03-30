class ApplicationController < ActionController::Base
  def index
  end

  def is_employee?
    current_user.user_level == 'employee'

  end

  def is_manager?
    current_user.user_level == 'manager'
  end

  def is_admin?
    current_user.user_level == 'admin'
  end
end
