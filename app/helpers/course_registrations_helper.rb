module CourseRegistrationsHelper
  def send_email_mailgun
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    message_params = {
      from: 'imtinyc@gmail.com',
      to:   current_user.email,
      subject: 'Course Confirmation',
      html:  "
      <p> Hi #{current_user.first_name} #{current_user.last_name} , </p>

      <p>This is a Confirmation that you have signed up for <strong>#{@course.name}</strong> course</p>

   "
    }

    mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!
  end
end
