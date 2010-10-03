class AddFollowerCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :follower_count, :integer
  end

  def self.down
    remove_column :users, :follower_count
  end
end
