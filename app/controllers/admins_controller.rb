class AdminsController < ApplicationController
  def show_users
    @users_admin = User.where(role: :admin)
    @users_local_school_admin = User.where(role: :local_school_admin)
    @users_not_admin = User.where('role > 1')
    render 'show_users'
  end
  def move_to_admin
  end
  def move_to_local_admin
  end
  def remove_admin
  end
end
