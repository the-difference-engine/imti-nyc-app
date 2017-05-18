class LocalSchoolsController < ApplicationController
  def index
    @school = current_user.local_school
  end

  def new
  end

  def create
    redirect_to "local_schools"
  end

  def edit
    @school = current_user.local_school
  end

  def update
    school = current_user.local_school
    school.assign_attributes( contact_name: params[:contact_name],
      school_address: params[:school_address], 
      bio: params[:bio])
    school.save
    redirect_to "/local_schools"
  end
end
