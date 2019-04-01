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

  def generate_ajax_response(type, identity)
    { type: type, identity: identity }
  end

  helper_method :is_employee?
  helper_method :is_manager?
  helper_method :is_admin?
end
