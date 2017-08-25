class AdminsController < ApplicationController

  def new
    
  end

  def assign_current_teacher
    application = Application.find_by(id: params[:application_id])
    p "$"* 50
    p params[:status]
    application.update(application_status: params[:status])

    if params[:status] == "approved"
      application.user.update(role: "current_teacher")
    end

    redirect_to "/completed_applications"
  end


end
