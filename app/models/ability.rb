class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :registered
      can [:read, :download_medium, :download_quadratic], Folder, :roles => { :id => user.role_ids }
      can [:read, :download_original, :download_medium, :download_thumb, :download_quadratic], Medium, :folder => { :roles => { :id => user.role_ids }}
      can :read, Comment, :medium => { :folder => { :roles => { :id => user.role_ids }}}
    else
    end
  end
end
