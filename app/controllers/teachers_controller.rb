class TeachersController < ApplicationController
  def index
    application = Application.find_by(user_id: current_user.id);
    if application.application_status != "accepted"
      flash[:danger] = "Access denied because user application status does not equal 'accepted'"
      redirect_to "/"
    end
  end
end
