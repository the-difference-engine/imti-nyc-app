module AdminsHelper
  def send_email_mailgun
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    binding.pry

    message_params = {
       from: 'imtinyc@gmail.com',
       to:   'dovybluming@gmail.com',
       subject: "Create Password",
       text:  "Welcome new admin! Your account account has been created.  Please use the link below to set your password."
      }

    result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end

  def self.send_mailgun_2
      RestClient.post "https://api:key-e9e94aca9f475a71df00dae854da9866@api.mailgun.net/v3/sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org/messages",
      :from => "Excited User <mailgun@sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org>",
      :to => "jordanhiattcodes@gmail.com",
      :subject => "Hello",
      :text => "Testing some Mailgun awesomness!"
  end
end


