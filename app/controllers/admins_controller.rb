class AdminsController < ApplicationController
  def show_users
    @users = User.all
    render 'show_users'
  end
end
