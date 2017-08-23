class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @donation = Donation.new
  end

  def confirmation
    @donation = Donation.new(
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      email:current_user.email,
      comment: params[:comment],
      amount: params[:amount],
      user_id: current_user.id,
      confirmed: false
  )
  # @donation = Donation.new(
  #     first_name: params[:first_name],
  #     last_name: params[:last_name],
  #     email: params[:email],
  #     comment: params[:comment],
  #     amount: params[:amount],
  #     user_id: current_user.id,
  #     confirmed: false
  #   )
    if @donation.amount.to_f > 4.99
      @donation.save
    else
      flash[:danger] = "Provide an amount."
      render 'new.html.erb'
    end

  end

  def create
    
  end
end
