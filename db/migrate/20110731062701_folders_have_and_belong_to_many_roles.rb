class FoldersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def self.up
    create_table :folders_roles, :id => false do |t|
      t.references :folder, :role
    end
  end

  def self.down
    drop_table :folders_roles
  end
end
