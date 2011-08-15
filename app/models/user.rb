class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :groups
  has_many :folders
  has_many :comments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :role_ids, :group_ids

  def role?(role)
    #return !!self.roles.find_by_name(role.to_s.camelize)
    return self.roles.find_by_name(role).try(:name) == role.to_s
  end

  def group?(group)
    return self.groups.find_by_name(group).try(:name) == group.to_s
  end
end
