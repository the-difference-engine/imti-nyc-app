require 'roo'

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :validate_params, only: :create
  after_action :set_school, only: :create
  prepend_before_action :set_minimum_password_length, only: :new_school

  def new_school
    new
  end

  def import
    User.import(params[:file])
    redirect_to root_url, notice: "Your import was succesful!"
  end

  private

  def validate_params
    if !User.role_params[params[:user][:role]].include?(URI(request.referer).path)
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

  def after_sign_up_path_for(resource)
    current_user.local_school_admin? ? local_schools_path : new_application_path
  end
end
