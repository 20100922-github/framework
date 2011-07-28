class AddDescriptionToFolder < ActiveRecord::Migration
  def self.up
    add_column :folders, :description, :text
  end

  def self.down
    remove_column :folders, :description
  end
end
