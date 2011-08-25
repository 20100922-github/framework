class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :read, :download_thumb, :download_medium, :download_quadratic, :download_original, :to => :read_all

    #user ||= User.new
    unless user

      can :read_all, Folder, :roles => { :name => "Public" }
      can :read_all, Medium, :folder => { :roles => { :name => "Public" }}
      cannot :manage, [User, Role]

    else

      can :read_all, Folder, :roles => { :id => user.role_ids }
      can :read_all, Medium, :folder => { :roles => { :id => user.role_ids }}
      can :read, Comment, :medium => { :folder => { :roles => { :id => user.role_ids }}}
      can :update, User, :id => user.id
      cannot :manage, [User, Role]

      if user.role? :Administrator
        cannot [:update, :destroy], Role, :name => "Administrator"
        can :manage, :all
      end
    end

  end
end
