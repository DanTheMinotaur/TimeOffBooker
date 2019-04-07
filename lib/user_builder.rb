
class UserBuilder
  attr_accessor :user, :days_off, :job_title
  def self.build
    builder = new
    yield(builder)
    builder.user
  end

  def initialize
    @user = User.new
  end

  def set_name(name)
    @user.name = name
  end

  def set_email(email)
    @email = email
  end

  def set_days_off(days)
    @days_off = days.to_i
  end

  def set_job_title(title)
    @job_title = title
  end

  def set_user_level(level)
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
    @user_level = user_level
  end
end