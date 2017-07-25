class Users::SessionsController < Devise::SessionsController
  include SessionsHelper
  before_action :send_admin_email, only: :destroy 

  def send_admin_email
    current_user.application
    if !current_user.application.try(:payment_status?)
      # send_email_mailgun
    end
  end
end
