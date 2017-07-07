class SessionsController < ApplicationController
  include SessionsHelper
  def destroy
    if Application.where(user_id: current_user.id).count > Charge.where(user_id: current_user.id).count
      send_email_mailgun
    end
    sign_out @user
    redirect_to "/sign_in"
  end
end
