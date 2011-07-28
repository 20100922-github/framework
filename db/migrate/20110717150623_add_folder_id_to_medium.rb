class AddFolderIdToMedium < ActiveRecord::Migration
  def self.up
    add_column :media, :folder_id, :integer
  end

  def self.down
    remove_column :media, :folder_id
  end
end
