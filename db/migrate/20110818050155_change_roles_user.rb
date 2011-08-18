class ChangeRolesUser < ActiveRecord::Migration
  def self.up
    drop_table :roles_users
    create_table :roles_users, :id => false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
  end

  def self.down
    drop_table :roles_users
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end
  end
end
