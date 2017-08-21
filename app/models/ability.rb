class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    local_school_admin_abilities
    admin_abilities
  end

  def local_school_admin_abilities
    return unless user.local_school_admin?

    can :create, LocalSchool
    can [:read, :update], LocalSchool, id: @user.local_school_id
  end

  def admin_abilities
    return unless user.admin?

    can :manage, :all
  end
end
