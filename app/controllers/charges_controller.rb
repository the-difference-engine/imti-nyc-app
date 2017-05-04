class ChargesController < ApplicationController
  def new
    @amount = 5.00
  end

  def create
    p "*" * 50
    p "hello"
    p "*" * 50
    # Amount in cents
    @amount = 100 * 100

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    ) 

    new_charge = current_user.charges.create(uid: charge.id, amount: charge.amount, description: charge.description, customer_id: customer.id)
    redirect_to charge_path(new_charge.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
  def show
    @charge = Charge.find(params[:id])
  end
end
