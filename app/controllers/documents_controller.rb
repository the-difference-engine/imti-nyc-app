class DocumentsController < ApplicationController
  
  def index
    @application = Application.find(params[:application_id])
    @documents = @application.documents
  end

  def new
    @application = Application.find(params[:application_id])
    @document = Document.new
  end

  def create
    @application = Application.find(params[:application_id])
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document saved."
      redirect_to application_documents_path(@application.id)
    else
      flash[:danger] = @document.errors.full_messages
      render :new
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      flash[:success] = "Document updated."
      redirect_to application_documents_path(@document.id)
    else
      flash[:danger] = @document.errors.full_messages
      render :edit
    end
  end

  private

  def document_params
    params.require(:document).permit(:attachment, :category).merge(application_id: params[:application_id])
  end

end
