class CreateMediaTags < ActiveRecord::Migration
  def self.up
    create_table :media_tags, :id => false do |t|
      t.integer :medium_id, :null => false
      t.integer :tag_id, :null => false
    end
  end

  def self.down
    drop_table :media_tags
  end
end
