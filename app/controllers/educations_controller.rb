class EducationsController < ApplicationController
  def index
    @application = Application.find(params[:application_id])
    
    @educations = @application.educations

  end

  def new
    @application = Application.find(params[:application_id])
    @education = Education.new
  end

  def create
    @application = Application.find(params[:application_id])
    @education = Education.new(education_params)
    
    if @education.save
      flash[:success] = "Education saved."
      redirect_to new_application_montessori_training_path(@application.id)
    else
      flash[:danger] = @education.errors.full_messages
      render :new
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      flash[:success] = "education updated."
      redirect_to edit_education_path(@education.id)
    else
      flash[:danger] = @education.errors.full_messages
      render :edit
    end
  end

  private

  def education_params
    params.require(:education).permit(:school, :location, :start_date, :end_date, :degree, :degree_date).merge(application_id: params[:application_id])
  end
end
