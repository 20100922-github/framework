class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium

  validates :text, :user_id, :medium_id, :presence => true
  validates :user_id, :medium_id, :numericality => { :only_integer => true }
end
