class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :workshop_footer 
  before_action :authenticate_user!, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to main_app.root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_initial, :role])
  end

  def after_sign_in_path_for(resource)
    if current_user.local_school_admin?
      local_schools_path
    else
      super
    end
  end

  def validate_admin?
    unless current_user && current_user.admin?
      redirect_to "/"
    end
  end

  def workshop_footer 
    @footer_workshops = Workshop.where("time >= ?", Time.now).limit(3).order("time asc")
  end
end
