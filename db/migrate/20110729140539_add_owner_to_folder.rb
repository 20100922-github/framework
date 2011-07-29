class AddOwnerToFolder < ActiveRecord::Migration
  def self.up
    add_column :folders, :user_id, :integer
  end

  def self.down
    remove_column :folders, :user_id
  end
end
