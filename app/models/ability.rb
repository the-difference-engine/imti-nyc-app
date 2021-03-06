class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    local_school_admin_abilities
    admin_abilities
    applicant_abilities
    current_teacher_abilities
    alumni_abilities
  end

  def current_teacher_abilities
    return unless @user.current_teacher?

    can :read, Course
    can :read, Application, user_id: @user.id
    if @user.application.present?
      can :read, Education, application_id: @user.application.id
      can :read, MontessoriTraining, application_id: @user.application.id
      can :read, WorkExperience, application_id: @user.application.id
      can :read, Reference, application_id: @user.application.id
      can :read, Document, application_id: @user.application.id
    end
  end

  def applicant_abilities
    return unless @user.international_applicant? || @user.domestic_applicant?
    can :read, Event
    can :manage, Application, user_id: @user.id
    if @user.application.present?
      can :manage, Education, application_id: @user.application.id
      can :manage, MontessoriTraining, application_id: @user.application.id
      can :manage, WorkExperience, application_id: @user.application.id
      can :manage, Reference, application_id: @user.application.id
      can :manage, Document, application_id: @user.application.id
    end
  end

  def local_school_admin_abilities
    return unless @user.local_school_admin?

    can :create, LocalSchool
    can [:read, :update], LocalSchool, id: @user.local_school_id
  end

  def admin_abilities
    return unless @user.admin?

    can :manage, :all
    cannot :alumni, User
  end

  def alumni_abilities
    return unless @user.alumni?

    can :alumni, User, id: @user.id
  end

end
