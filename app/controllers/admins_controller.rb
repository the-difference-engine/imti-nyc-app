class AdminsController < ApplicationController
  def show_users
    @users = User.all
    render 'show_users'
  end
  def move_to_admin
  end
  def move_to_local_admin
  end
  def remove_admin
  end
end
