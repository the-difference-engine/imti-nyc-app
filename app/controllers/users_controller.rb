class UsersController < ApplicationController
  before_action :validate_admin?
  def index
    @users = User.where.not(id: current_user.id)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(course_id: nil)
    redirect_to "/courses"
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    flash[:danger] = "The user has been removed :("
    redirect_to "/users"
  end

end