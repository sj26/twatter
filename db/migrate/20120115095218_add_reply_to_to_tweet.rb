class AddReplyToToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :reply_to_id, :integer
    add_index :tweets, :reply_to_id
  end
end
