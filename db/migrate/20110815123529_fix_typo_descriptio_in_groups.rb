class FixTypoDescriptioInGroups < ActiveRecord::Migration
  def self.up
    remove_column :groups, :descriptio
    add_column :groups, :description, :string
  end

  def self.down
    remove_column :groups, :description
    add_column :groups, :descriptio, :string
  end
end
