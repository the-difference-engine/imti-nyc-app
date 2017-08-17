class TeachersController < ApplicationController
  def index
    if current_user.application.application_status != "accepted"
      flash[:danger] = "Your application must first be accepted in order to access this page."
      redirect_to "/"
    end
  end
end
