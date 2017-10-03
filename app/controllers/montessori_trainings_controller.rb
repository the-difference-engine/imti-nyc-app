class MontessoriTrainingsController < ApplicationController
  load_and_authorize_resource :application
  load_and_authorize_resource :montessori_training, through: :application

  def index
    @application = Application.find(params[:application_id])
    @montessori_trainings = @application.montessori_trainings
  end

  def new
    @application = Application.find(params[:application_id])
    @montessori_training = MontessoriTraining.new
  end

  def create
    @application = Application.find(params[:application_id])
    @montessori_training = MontessoriTraining.new(montessori_training_params)
    if @montessori_training.save
      flash[:success] = "Montessori training saved."
      redirect_to application_montessori_trainings_path
    else
      flash[:danger] = @montessori_training.errors.full_messages
      render :new
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @montessori_training = MontessoriTraining.find(params[:id])
  end

  def update
    @montessori_training = MontessoriTraining.find(params[:id])
    if @montessori_training.update(montessori_training_params)
      flash[:success] = "Montessori training updated."
      redirect_to application_montessori_trainings_path
    else
      flash[:danger] = @montessori_training.errors.full_messages
      render :edit
    end
  end

  private

  def montessori_training_params
    params.require(:montessori_training).permit(:experience, :name, :location, :diploma, :degree, :degree_date).merge(application_id: params[:application_id])
  end
end
