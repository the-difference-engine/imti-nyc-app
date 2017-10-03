class WorkExperiencesController < ApplicationController
  load_and_authorize_resource :application
  load_and_authorize_resource :work_experience, through: :application

  def index
    @application = Application.find(params[:application_id])
    @work_experiences = @application.work_experiences
  end

  def new
    @application = Application.find(params[:application_id])
    @work_experience = WorkExperience.new
  end

  def create
    @application = Application.find(params[:application_id])
    @work_experience = WorkExperience.new(work_experience_params)
    current_job = params[:work_experience][:current_job] == "1" ? true : false
    @work_experience.current_job = current_job
    if @work_experience.save
      flash[:success] = "Work_Experience saved."
      redirect_to application_work_experiences_path
    else
      flash[:danger] = @work_experience.errors.full_messages
      render :new
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @work_experience = WorkExperience.find(params[:id])
  end

  def update
    @application = Application.find(params[:application_id])
    @work_experience = WorkExperience.find(params[:id])
    current_job = params[:work_experience][:current_job] == "1" ? true : false
    @work_experience.current_job = current_job
    if @work_experience.update(work_experience_params)
      flash[:success] = "work_experience updated."
      redirect_to application_work_experiences_path
    else
      flash[:danger] = @work_experience.errors.full_messages
      render :edit
    end
  end

  private

  def work_experience_params
    params.require(:work_experience).permit(:employer, :occupation, :start_date, :end_date).merge(application_id: params[:application_id])
  end
end
