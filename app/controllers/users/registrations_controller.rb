class Users::RegistrationsController < Devise::RegistrationsController
  before_action :validate_params, only: :create
  after_action :set_school, only: :create

  def new_school
    new
  end 

  private 

  def validate_params
    if URI(request.referer).path != User.role_params[params[:user][:role]]
      flash[:danger] = "Please don't mess with the forms!"
      redirect_to request.referer and return
    elsif params[:user][:role] == 'local_school_admin' && params[:school_name].blank?
      flash[:danger] = "Please add the School name"
      redirect_to request.referer and return
    end
  end

  def set_school
    return unless resource.local_school_admin?
    school = LocalSchool.create(name: params[:school_name])
    resource.update(local_school_id: school.id)
  end
end
