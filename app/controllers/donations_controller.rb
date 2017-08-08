class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    donation = Donation.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      comment: params[:comment],
      amount: params[:amount]
    )
    if donation.save
      flash[:success] = "Donation submitted"
      redirect_to "/"
    else
      flash[:danger] = "YOU DID IT WROOOOOOOOOONG"
      redirect_to "/donations/new"
    end
  end
end
