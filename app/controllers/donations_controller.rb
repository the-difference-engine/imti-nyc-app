class DonationsController < ApplicationController
	skip_before_action :authenticate_user!, except: [:index]

  def new

	end

	def create
		if donation_params[:other_amount] == ""
    	amount = (donation_params[:amount].to_i * 100)
    else
    	amount = (donation_params[:other_amount].to_i * 100)
    end

    customer = Stripe::Customer.create(
      :email => donation_params[:email],
      :source  => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => "Donation",
      :currency    => 'usd'
      )

    @donation = Donation.create(uid: charge.id, amount: amount / 100, first_name: donation_params[:first_name],last_name: donation_params[:last_name], email: donation_params[:email], comment: donation_params[:comment])
    render 'show'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/donations/new"
  end

  def donation_params
    params.permit(:amount, :other_amount, :first_name, :last_name, :anonymous, :email, :comment)
  end
  
end
