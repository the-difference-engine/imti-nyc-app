class StudentProfilesController < ApplicationController

  def edit
    @student = current_user
  end

  def update
<<<<<<< HEAD
    @student = current_user
    application = current_user.application
    if @student.update(user_params) && application.update(application_params)
      flash[:success] = "Student Profile Successfully Update"
      redirect_to '/student_profiles'
    else
      flash[:danger] = @student.errors.full_messages
      render 'edit.html.erb'
    end
  end

  def create
    # To be coded when system admin has capability to mark application as accepted
=======
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
    
>>>>>>> 55398ee5361af06c5ed1db163dd81c80ff7a0e0f
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
