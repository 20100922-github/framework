class Medium < ActiveRecord::Base
  belongs_to :folder
  has_and_belongs_to_many :tags
  has_attached_file :file,
                    :path => ":rails_root/private/:class/:id/:style/:basename.:extension",
                    :url => "/:class/:id/download"
end
