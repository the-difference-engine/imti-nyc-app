class DonationsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index]

  def new
    @donation = Donation.new
  end

  def create
    #   rewrite controller create code to create the donation as Donation.new, then check if it's valid, then charge, then save the donation.

    if donation_params[:other_amount] == ""
      amount = (donation_params[:amount].to_i * 100)
    else
      amount = (donation_params[:other_amount].to_f.round(2) * 100).to_i
    end

    @donation = Donation.new(amount: amount / 100.0, first_name: donation_params[:first_name],last_name: donation_params[:last_name], email: donation_params[:email], comment: donation_params[:comment])

    if @donation.save

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

      @donation.update(uid: charge.id)

      if donation_params[:anonymous]
        @donation.update(first_name: nil, last_name: nil, email: nil)
      end
      render 'show'

    else
      p @donation.errors.full_messages
      render 'new'
    end #end if @donation.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/donations/new"
  end

  def donation_params
    params.permit(:amount, :other_amount, :first_name, :last_name, :anonymous, :email, :comment)
  end
  
end
