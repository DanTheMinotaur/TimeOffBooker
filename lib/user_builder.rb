class UserBuilder
  class UserBuilder
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

    end

    def user
      @user
    end
  end
end