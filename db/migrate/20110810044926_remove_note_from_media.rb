class RemoveNoteFromMedia < ActiveRecord::Migration
  def self.up
    remove_column :media, :note
  end

  def self.down
    add_column :media, :note, :text
  end
end
