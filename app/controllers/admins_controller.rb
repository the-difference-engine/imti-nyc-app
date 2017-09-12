class AdminsController < ApplicationController
  include AdminsHelper

  def new
    @admin = User.new
  end

  def create
    password = rand(10 ** 10)
    p admin_params
    @admin = User.new(admin_params)
    @admin.password = password
    @admin.password_confirmation = password
    @admin.role = 0
    if @admin.save
      @admin.send_reset_password_instructions
      redirect_to "/admins/new"
    else
      flash[:danger] = @admin.errors.full_messages
      render "/admins/new"
    end
  end

  def assign_current_teacher
    application = Application.find_by(id: params[:application_id])
    p params[:status]
    application.update(application_status: params[:status])

    if params[:status] == "approved"
      application.user.update(role: "current_teacher")
    end

    redirect_to "/completed_applications"
  end

private

  def admin_params
    params.require(:user).permit(:email, :first_name, :middle_initial, :last_name)
  end


end
