class StudentProfilesController < ApplicationController

  def edit
    @student = current_user
  end

  def update
    student = current_user
    application = current_user.application
    if student.update(user_params) && application.update(application_params)
      flash[:success] = "Student Profile Successfully Update"
      redirect_to '/student_profiles'
    else
      flash[:danger] = student.errors.full_messages 
    end
  end

  def new
    
  end

  def create
    
  end

  def index
    @title = "Profile"
    @student = current_user
  end

  private 

  def user_params
    params.permit(:first_name, :middle_initial, :last_name)
  end

  def application_params
    params.permit( :street, :city, :state, :zip_code)
  end

end
