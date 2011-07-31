class Folder < ActiveRecord::Base

  has_many :media
  # owner
  belongs_to :user
  # roles that are allowed to access folder
  has_and_belongs_to_many :roles

  has_attached_file :cover,
                    :path => ":rails_root/private/:class/:id/:style/:basename.:extension",
                    :url => "/:class/:id/download_:style",
                    :styles => { :medium => "300x300>", :quadratic => "200x200#" }
end
