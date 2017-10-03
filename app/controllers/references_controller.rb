class ReferencesController < ApplicationController
  load_and_authorize_resource :application
  load_and_authorize_resource :reference, through: :application

  def index
    @application = Application.find(params[:application_id])
    @references = @application.references
  end

  def new
    @application = Application.find(params[:application_id])
    @reference = Reference.new
  end

  def create
    @application = Application.find(params[:application_id])
    @reference = Reference.new(reference_params)
    if @reference.save
      flash[:success] = "reference saved."
      redirect_to application_references_path
    else
      flash[:danger] = @reference.errors.full_messages
      render :new
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])
    if @reference.update(reference_params)
      flash[:success] = "reference updated."
      redirect_to application_references_path
    else
      flash[:danger] = @reference.errors.full_messages
      render :edit
    end
  end

  private

  def reference_params
    params.require(:reference).permit(:name, :address, :position).merge(application_id: params[:application_id])
  end
end
