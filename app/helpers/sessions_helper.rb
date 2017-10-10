module SessionsHelper
  def send_admin_email_mailgun

    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])

    message_params =  {
                       from: 'imtinyc@gmail.com',
                       to:   'jamieronin@gmail.com',
                       subject: "The user #{current_user.first_name} #{current_user.last_name} hasn't finished the application",
                       text:    "The user #{current_user.first_name} #{current_user.last_name} hasn't finished the application. You can email them at: #{current_user.email}"
                      }

    result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end
end
