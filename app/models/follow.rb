class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
  has_many :follower_statuses, through: :follower
  has_many :followee_statuses, through: :followee

  validates :follower, :followee, presence: true
  validates :follower_id, uniqueness: {scope: "follower_id"}
end
