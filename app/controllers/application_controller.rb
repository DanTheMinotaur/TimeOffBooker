require 'company'
#require 'lib/company'

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  Company.instance.set_company_name('EnviroCorp')
  Company.instance.set_news_term('Cheese')
  Company.instance.set_country('IE')

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
