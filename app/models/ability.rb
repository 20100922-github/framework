class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.role? :Administrator
      can :manage, :all
    elsif user.role? :Users
      can [:read, :download_medium, :download_quadratic], Folder, :groups => { :id => user.group_ids }
      can [:read, :download_original, :download_medium, :download_thumb, :download_quadratic], Medium, :folder => { :groups => { :id => user.group_ids }}
      can :read, Comment, :medium => { :folder => { :groups => { :id => user.group_ids }}}
    else
    end
  end
end
