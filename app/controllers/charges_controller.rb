class ChargesController < ApplicationController
  # Stripe.api_key = ENV['stripe_secret_key']
  def new
    @donation= Donation.new
  end
  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    Stripe::Charge.create(
      :amount => (current_user.donations.last.amount*100).to_i,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "Charge for charlotte.jones@example.com"
)

      current_user.donations.last.update(confirmed: true)
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
