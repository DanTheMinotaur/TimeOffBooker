class Employee
  ##
  # Employee Class for holiding data
  attr_accessor :name, :email, :days_off, :job_title, :user_level, :password
end

class EmployeeBuilder
  ##
  # Class for Building a User for application using Builder pattern
  attr_accessor :employee
  def self.build
    builder = new
    yield(builder)
    builder.employee
  end

  def initialize
    @employee = Employee.new
  end

  def name(name)
    @employee.name = name
  end

  def email(email)
    @employee.email = email
  end

  def days_off(days)
    @employee.days_off = days.to_i
  end

  def job_title(title)
    @employee.job_title = title
  end

  def password(password)
    @employee.password = password
  end

  def user_level(level)
    user_level = 1
    valid_options = {
        manager: 2,
        employee: 1,
        admin: 3
    }
    if level.instance_of?(String) && valid_options.key?(level)
        user_level valid_options[level]
    elsif level.instance_of?(Integer) && level.between?(1, 3)
        user_level = level
    end
    @employee.user_level = user_level
  end

  def for_model
    {
        name: @employee.name,
        password: @employee.password,
        password_confirmation: @employee.password,
        user_level: @employee.user_level,
        days_off: @employee.days_off,
        email: @employee.email,

    }
  end
end