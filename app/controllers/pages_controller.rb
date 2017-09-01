class PagesController < ApplicationController
  include PagesHelper
  skip_before_action :authenticate_user!

  def index
  end

  def about
    @title = "About Us"
  end

  def calendar
    @title = "Calendar"
  end

  def contact
    @title = "Contact"
  end

  def send_message
      send_email_mailgun
      send_email_confirmation
      flash[:success] = "Message has been sent"
    else
      flash[:danger] = "Message failed to send"
    end
    redirect_to '/'
  end

  def template
    @title = "Example Title"
  end

end
