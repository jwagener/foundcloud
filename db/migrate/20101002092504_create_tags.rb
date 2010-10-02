class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string  :name
      t.string  :permalink
      t.integer :position
      t.integer :creator_id
      t.string  :image_url
      t.string  :color
      t.string  :secret
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
