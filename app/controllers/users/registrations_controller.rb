class Users::RegistrationsController < Devise::RegistrationsController
  before_action :validate_params, only: :create
  after_action :set_role, only: :create
  after_action :set_school, only: :create
  prepend_before_action :set_minimum_password_length, only: :new_school
  require 'roo'

  def new_school
    new
  end

  def import
    User.import(params[:file])
    redirect_to root_url, notice: "Your import was succesful!"
  end

  private

  def set_role
    current_user.role = params[:user][:role]
  end

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

  def after_sign_up_path_for(_)
    applications_path
  end
end
