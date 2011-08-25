class Ability
  include CanCan::Ability

  def initialize(user)

    #user ||= User.new
    unless user
      can :read, Folder, :roles => { :name => "Public" }
      can :read, Medium, :folder => { :roles => { :name => "Public" }}
      cannot :manage, [User, Role]
    else
      can [:read, :download_medium, :download_quadratic], Folder, :roles => { :id => user.role_ids }
      can [:read, :download_original, :download_medium, :download_thumb, :download_quadratic], Medium, :folder => { :roles => { :id => user.role_ids }}
      can :read, Comment, :medium => { :folder => { :roles => { :id => user.role_ids }}}
      can :manage, User, :id => user.id
      cannot :manage, [User, Role]

      if user.role? :Administrator
        can :manage, :all
      end
    end

  end
end
