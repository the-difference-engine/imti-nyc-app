class DocumentsController < ApplicationController
  include DocumentsHelper
  
  def index
    @application = Application.find(params[:application_id])
    @documents = @application.documents
  end

  def new
    @application = Application.find(params[:application_id])
    @document = Document.new
  end
  
  #imtinyc@gmail.com is the public e-mail 
  def create 
    @application = Application.find(params[:application_id])
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document saved."
      finished = finish_domestic_documents(@application)

      flash[:success] = "E-mail sent to confirm all neccessary documents have been uploaded." if finished
      send_email_mailgun if finished

      send_unfinished_email_mailgun if list_of_domestic_documents >=1 && destroy_user_session_path(method: :delete)

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
