class StudentProfilesController < ApplicationController

  def edit
    @student = current_user
  end

  def update
    current_user.update()
  end

  def new
    
  end

  def create
    
  end

  def index
    @title = "Profile"
    @student = current_user
  end

end
