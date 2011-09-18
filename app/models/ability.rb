class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :read, :download_thumb, :download_medium, :download_quadratic, :download_original, :to => :read_all

    #user ||= User.new
    unless user

#      entities:
#      Folder
#      Medium
#      Comment
#      Tag
#      Role
#      User

      can :read_all, Folder, :roles => { :name => "Public" }
      can :read_all, Medium, :folder => { :roles => { :name => "Public" }}
      can :read, Tag, :media => { :folder => { :roles => { :name => "Public" }}}
      can :read, Comment, :medium => { :folder => { :roles => { :name => "Public" }}}
      cannot :manage, [User, Role]

    else

      can :read_all, Folder, :roles => { :name => "Public" }
      can :read_all, Folder, :roles => { :id => user.role_ids }
      can :create, Folder
      can [:update, :destroy], Folder, :user => { :id => user.id }

      can :read_all, Medium, :folder => { :roles => { :name => "Public" }}
      can :read_all, Medium, :folder => { :roles => { :id => user.role_ids }}
      can :create, Medium
      can [:update, :destroy], Medium, :folder => { :user => { :id => user.id }}

      can :read, Comment, :medium => { :folder => { :roles => { :name => "Public" }}}
      can :read, Comment, :medium => { :folder => { :roles => { :id => user.role_ids }}}
      can :create, Comment
      can [:update, :destroy], Comment, :medium => { :folder => { :user => { :id => user.id }}}

      can :read, Tag

      can [:read, :update], User, :id => user.id

      if user.role? :Administrators

        cannot [:update, :destroy], Role, :name => "Administrators"
        cannot [:update, :destroy], Role, :name => "Public"
        can [:create, :read], Role
        can [:update, :destroy], [Folder, Medium]
        can :manage, [Tag, Comment, User]

      end
    end

  end
end
