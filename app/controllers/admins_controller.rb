class AdminsController < ApplicationController
  def show_users
    @users_admin = User.where(role: :admin)
    @users_local_school_admin = User.where(role: :local_school_admin)
    @users_not_admin = User.where('role > 1')
    render 'show_users'
  end

  def move_to_admin
    user = User.find_by(id: params[:user_id])
    user.role = "admin"
    user.save
    redirect_to :back
  end

  def move_to_local_school_admin
    user = User.find_by(id: params[:user_id])
    user.role = "local_school_admin"
    user.save
    redirect_to "/show_users"
  end

  def select_school
    @schools = LocalSchool.all
    @user_id = params[:user_id]
    render "select_school.html.erb"
  end

  def remove_admin
    #delete user
    user = User.find_by(id: params[:user_id])
    user.role = "member"
    user.save
    redirect_to :back
  end

  def destroy_user
    user = User.find_by(id: params[:user_id])
    user.destroy
    redirect_to :back
  end
end
