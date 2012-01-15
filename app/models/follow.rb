class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
  has_many :follower_tweets, through: :follower
  has_many :followee_tweets, through: :followee

  validates :follower, :followee, presence: true
  validates :follower_id, uniqueness: {scope: "followee_id"}
end
