class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, null: false
      t.references :followee, null: false

      t.timestamps
    end
    add_index :follows, [:follower_id, :followee_id], unique: true
    add_index :follows, [:followee_id, :follower_id]
  end
end
