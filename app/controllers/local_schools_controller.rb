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
    school.assign_attributes(school_params)
    school.save
    redirect_to "/local_schools"
  end

  private

  def school_params
    params.require(:local_school).permit(:contact_name, :school_address, :bio)
  end
end
