class DocumentsController < ApplicationController
  include DocumentsHelper

  def index
    @application = Application.find(params[:application_id])
    @documents = []

    document_lists.each do |name, key|
      document_info = {}
      document_info[:name] = name
      document_info[:key_name] = key
      if @application.documents.find_by(category: key)
        document_info[:attachment] = file_name(@application.documents, key)
        document_info[:document_id] = Document.find_by(application_id: @application.id, category: key).id
        @document = Document.find_by(application_id: @application.id, category: key)
      else
        @document = Document.new
      end
      @documents << document_info
    end
    p '-' * 100
    p @documents
  end

  # No longer need this page?
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
      redirect_to application_documents_path(@application.id)
    elsif @document.save && !finished && current_user.destroy_user_session_path
      send_unfinished_email_mailgun
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
      redirect_to application_documents_path(@document[:application_id])
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
