# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      can :access, :rails_admin     # only allow admin users to access Rails Admin
    end

    if user.is_role? "supervisor"
      can :read, "Dashboard"
      can [:read, :create, :update, :destroy], Staticpage
      can [:read, :create, :update, :destroy], Title
      can [:read, :create, :update, :destroy], Jesuit
      can [:read, :create, :update, :destroy], Province
      can [:read, :create, :update, :destroy], Place
    end

    if user.is_role? "editor"
      can :read, "Dashboard"
      can [:read, :create, :update], Title
      can [:read, :create, :update], Jesuit
      can [:read, :create, :update], Province
      can [:read, :create, :update], Place
    end

    # leave empty since this role should not have access to any backend services
    if user.is_role? "noaccess"
    end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
