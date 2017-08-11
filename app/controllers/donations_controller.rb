class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @donation = Donation.new
  end

  def confirmation
    @donation = Donation.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      comment: params[:comment],
      amount: params[:amount]
    )
    if @donation.amount.to_f > 0
      render 'confirmation.html.erb'
    else
      flash[:danger] = "Provide an amount."
      render 'new.html.erb'
    end
  end

  def create
    @donation = Donation.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      comment: params[:comment],
      amount: params[:amount]
    )
    if @donation.save
      flash[:success] = "Thank you #{@donation.first_name}! Your donation of #{ActionController::Base.helpers.number_to_currency(@donation.amount.to_f)} has been submitted."
      redirect_to "/"
    else
      flash[:danger] = "Provide an amount."
      render 'new.html.erb'
    end
  end
end
