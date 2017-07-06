class LocalSchoolsController < ApplicationController
  def index
    @school = current_user.local_school
  end

  def edit
    @school = current_user.local_school
  end

  def update
    @local_school = LocalSchool.find(params[:id])
    if @local_school.update(school_params)
      flash[:success] = "Local school updated"
      redirect_to "/local_schools"
    else
      flash[:danger] = @local_school.errors.full_messages
      render :edit
    end
  end

  private

  def school_params
    params.require(:local_school).permit(:contact_name, :school_address, :bio)
  end
end
