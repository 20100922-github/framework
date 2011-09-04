class Medium < ActiveRecord::Base
  belongs_to :folder
  has_and_belongs_to_many :tags
  has_many :comments

  has_attached_file :file,
                    :path => ":rails_root/private/:class/:id/:style/:basename.:extension",
                    :url => "/:class/:id/download_:style",
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :quadratic => "50x50#" }

  validates :file_file_name, :folder_id, :presence => true
  validates :folder_id, :numericality => { :only_integer => true }

  def next
    Medium.where("id > ? and folder_id = ?", self.id, self.folder.id).order("id ASC").first
  end

  def previous
    Medium.where("id < ? and folder_id = ?", self.id, self.folder.id).order("id DESC").first
  end

  def up
    Folder.where("id = ?", self.folder.id).first
  end
end
