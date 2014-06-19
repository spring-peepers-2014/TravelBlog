class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  has_many :trips, dependent: :destroy
  has_many :location_pins, through: :trips
  has_many :posts, through: :trips

  validates :email, presence: true, :uniqueness => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true, :length => { :minimum => 6, :message => "must be at least 6 characters" }
  validates :password_digest, presence: true, :length => { :minimum => 6, :message => "must be at least 6 characters" }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, pass)
    @user = User.find_by_email(email)
    if @user && (@user.password == pass)
      @user
    else
      nil
    end
  end

end
