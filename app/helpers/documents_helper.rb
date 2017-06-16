module DocumentsHelper

  def document_lists
    current_user.international_applicant? ? [['Health Form', 'health_form'], ['Personal Essay', 'personal_essay'], ['Recommendation', 'recommendation'], ['Resumé', 'resume'], ['TOEFL/IELTS Score Report', 'toefl_ielts_score_report'], ['Transcript', 'transcript'], ['WES Evaluation', 'wes_evaluation'], ['Contract', 'contract'], ['Student Visa', 'student_visa'], ['Passport Photo', 'passport_photo']] :
      [['Health Form', 'health_form'], 
      ['Personal Essay', 'personal_essay'], 
      ['Recommendation', 'recommendation'], 
      ['Resumé', 'resume'], 
      ['Contract', 'contract'], 
      ['Transcript', 'transcript']]  
  end

  def file_name(documents, category)
    file_name = documents.find_by(category: category).attachment_file_name
  end
 
  def send_email_mailgun
    mg_client = Mailgun::Client.new(ENV["MAILGUN_API_KEY"])

    message_params =  {
                       from: 'imtinyc@gmail.com',
                       to:   'imtinyc@gmail.com',
                       subject: 'All Documents Uploaded Successfully!',
                       text:    'You did it! You are now ready to pay the application fee'
                      }

    result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end 

  def send_unfinished_email_mailgun
    mg_client = Mailgun::Client.new(ENV["MAILGUN_API_KEY"])

    message_params =  {
                       from: 'imtinyc@gmail.com',
                       to:   'imtinyc@gmail.com',
                       subject: 'Incomplete Application - Documents Missing',
                       text:    'Sorry! The following documents are missing from your application.'
                      }

    result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end 

  def finish_domestic_documents(application)
    list_of_domestic_documents = ['health_form', 'personal_essay', 'recommendation', 'resume', 'contract', 'transcript'] 

    return false if application.documents.count != list_of_domestic_documents.size

    current_documents = []
    application.documents.each do |document|
      current_documents << document.category
    end 

    current_documents.sort == list_of_domestic_documents.sort
  end 

end
