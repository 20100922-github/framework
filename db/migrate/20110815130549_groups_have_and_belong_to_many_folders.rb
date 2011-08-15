class GroupsHaveAndBelongToManyFolders < ActiveRecord::Migration
  def self.up
    create_table :folders_groups, :id => false do |t|
      t.references :folder, :group
    end
  end

  def self.down
    drop_table :folders_groups
  end
end
