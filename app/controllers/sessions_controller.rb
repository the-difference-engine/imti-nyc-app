class SessionsController < ApplicationController
  def destroy
    p "DID I MAKE IT TO THE SESSIONS DESTROY CONTROLLER??????????????????????"
    if Application.where(user_id: current_user.id).count > Charge.where(user_id: current_user.id).count
      p "****************************************************Send an email"
      p "Application.where(user_id: current_user.id).count is #{Application.where(user_id: current_user.id).count}"
      p "Charge.where(user_id: current_user.id).count is #{Charge.where(user_id: current_user.id).count}"
      
    end
    sign_out @user
    redirect_to "/sign_in"
  end
end
