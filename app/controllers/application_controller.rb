require 'company'
require 'json'

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  company_data = JSON.parse(File.read('./config/company.json'))
  Company.instance.set_company_name(company_data['company_name'])
  Company.instance.set_news_term(company_data['news_term'])
  Company.instance.set_country(company_data['country'])

  def configure_permitted_parameters
    # Config for devise gem
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def index
  end

  def is_employee?
    # checks if user is an employee
    current_user.user_level == 'employee'
  end

  def is_manager?
    # Checks if user is a manager
    current_user.user_level == 'manager'
  end

  def is_admin?
    # checks if user is an admin
    current_user.user_level == 'admin'
  end

  def generate_ajax_response(type, identity)
    # Generates a standardised Ajax response for JavaScript.
    { type: type, identity: identity }
  end

  helper_method :is_employee?
  helper_method :is_manager?
  helper_method :is_admin?
end
