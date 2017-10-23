module PagesHelper
  def send_email_mailgun
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    message_params = {
      from: 'imtinyc@gmail.com',
      to:   'imtinyc@gmail.com',
      subject: params[:subject],
      html:  "
      <p>Name: #{params[:name]}</p>
      <p>Email: #{params[:email]}</p>
      <p>Phone Number: #{params[:number]}</p>
      <h3>Message</h3>
      <p>#{params[:message]}</p>"
    }

    mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!
  end

  def send_email_confirmation
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    message_params = {
      from: 'imtinyc@gmail.com',
      #  Will replace to: email to params[:email] once in production
      to:   'imtinyc@gmail.com',
      subject: params[:subject],
      html:  "
      <p>Hello #{params[:name]}</p>
      <p>Your message has been successfully been sent to IMTI!</p>
      <h3>Message</h3>
      <p>#{params[:message]}</p>"
    }
    #  need to change sandbox to production to allow emails to be sent to external email addresses
    mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!
  end
end
