class Tag < ActiveRecord::Base
  has_and_belongs_to_many :media

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
