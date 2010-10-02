class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :sc_id
      t.string    :username
      t.string    :full_name
      t.string    :permalink_url
      t.string    :avatar_url
 
      t.integer   :position
      t.integer   :tag_id
      t.timestamps
    end
    
    add_index :users, :tag_id
  end

  def self.down
    drop_table :users
  end
end
