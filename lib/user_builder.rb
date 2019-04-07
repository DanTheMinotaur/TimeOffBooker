
class UserBuilder
  attr_accessor :user, :days_off, :job_title, :days_off
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

  def user
    @user
  end

  def set_email(email)
    @email = email
  end

  def email
    @email
  end

  def set_days_off(days)
    @days_off = days.to_i
  end

  def days_off
    @days_off
  end

  def job_title
    @job_title
  end

  def set_job_title(title)
    @job_title = title
  end

  def set_user_level(level)

    @user_level = level
  end
end