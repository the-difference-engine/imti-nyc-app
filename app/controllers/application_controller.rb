class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_initial, :role])
  end

  def after_sign_in_path_for(resource)
    if current_user.local_school_admin?
      local_schools_path
    end
    if current_user.local_school_admin?
      redirect_to local_schools_path
    end
  end
end
