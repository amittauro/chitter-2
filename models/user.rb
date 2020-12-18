require 'bcrypt'

class User < ActiveRecord::Base
  has_many :peeps
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

  def self.create_with_bcrypt(email:, password:, name:, username:)
    user = self.new(
      email: email,
      name: name,
      username: username
    )
    user.password = password
    user.save!
    user
  end
end
