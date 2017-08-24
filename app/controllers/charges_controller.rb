class ChargesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @donation= Donation.new
  end
  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    if current_user
      Stripe::Charge.create(
      :amount => (current_user.donations.last.amount*100).to_i,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "Charge for charlotte.jones@example.com")
      current_user.donations.last.update(confirmed: true)
   else
     Stripe::Charge.create(
      :amount => (Donation.all.where(email:params[:stripeEmail]).last.amount*100).to_i,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "Charge for charlotte.jones@example.com")
    end
    Donation.all.where(email:params[:stripeEmail]).last.update(email: params[:stripeEmail],confirmed: true)

      # first_name: @donation.first_name,
      # last_name: @donation.last_name,
      # email: @donation.email,
      # comment: @donation.comment,
    #   amount: @donation.amount,
    #   confirmed: true
    # )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
