class User < ActiveRecord::Base

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/

  has_many :surveys

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
