require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.exists?(username:, email:)
    if self.find_by(username: username) || self.find_by(email: email)
      true
    else
      false
    end
  end
end
