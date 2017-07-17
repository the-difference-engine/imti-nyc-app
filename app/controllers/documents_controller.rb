class DocumentsController < ApplicationController
  include DocumentsHelper

  def index
    @application = Application.find(params[:application_id])
    @documents_needed = []
    existing_categories = @application.documents.map(&:category)
    # make logic to find documents we don't have

    document_lists.each do |label, category|
      unless existing_categories.include?(category)
        @documents_needed << [label, category]
      end
    end
  end

  def create
    @application = Application.find(params[:application_id])

    unless params[:document].nil?
      params[:document].each do |attachment_name, attachment|
        existing_doc_attachment = @application.documents.find_by(category: attachment_name)
        existing_doc_attachment.destroy if existing_doc_attachment
        @application.documents.create(attachment: attachment, category: attachment_name)
      end
    end
    redirect_to application_documents_path(@application.id)
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
