class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

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
