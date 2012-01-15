class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply_to, class_name: "Tweet"

  validates :text, presence: true, length: {maximum: 140}

  def initialize *args, &block
    super(*args, &block).tap do
      self.text ||= "@#{reply_to.user} " if reply_to.present?
    end
  end
end
