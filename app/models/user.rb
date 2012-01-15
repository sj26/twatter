class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable

  has_many :statuses

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 15}, format: {with: /\A[a-z0-9._-]+\Z/i}
  validates :email, uniqueness: true, format: {with: /@/}, allow_blank: true

  def self.find_for_authentication conditions
    find_or_create_by_username conditions[:username]
  end

  def valid_password? password
    if encrypted_password.blank? and password.present?
      self.password = password
      save!
    else
      super
    end
  end

  def to_param
    username
  end

  def to_s
    username
  end
end