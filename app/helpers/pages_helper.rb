module PagesHelper
  def send_email_mailgun
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])

    message_params = {
       from: 'imtinyc@gmail.com',
       to:   'dovybluming@gmail.com',
       subject: params[:subject],
       html:  "
         <p>Name: #{params[:name]}</p>
         <p>Email: #{params[:email]}</p>
         <p>Phone Number: #{params[:number]}</p>
         <h3>Message</h3>
         <p>#{params[:message]}</p>"
      }

    result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end
end
