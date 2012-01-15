class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable

  has_many :tweets
  has_many :followee_follows, class_name: "Follow", foreign_key: "followee_id"
  has_many :follower_follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :followee_follows, source: :follower
  has_many :following, through: :follower_follows, source: :followee
  has_many :following_tweets, through: :following, source: :tweets

  def tweets_and_following_tweets
    Tweet.joins("LEFT JOIN follows ON follows.followee_id = tweets.user_id").where("tweets.user_id = ? OR follows.follower_id = ?", id, id)
  end

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
