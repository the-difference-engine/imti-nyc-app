class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def create
    token = params[:stripeToken]
    amount = params[:amount].to_i * 100
    email = if params[:anonymous] == 'off'
              if user_signed_in?
                params[:email].presence || current_user.email
              else
                params[:email]
              end
            end

    customer = Stripe::Customer.create(
      email: email,
      source: token
    )

    stripe_charge = Stripe::Charge.create(
      amount: amount,
      currency: "usd",
      customer: customer.id
    )

    charge = Charge.create(
      amount: amount / 100,
      email: email,
      description: stripe_charge.description,
      uid: stripe_charge.id,
      customer_id: customer.id,
      charge_type: 'donation'
    )

    if user_signed_in? && params[:anonymous] == 'off'
      charge.update(user_id: current_user.id)
    end

    flash[:success] = "Thanks you for your donation!"
    redirect_to donations_path
  end

  private

  def anonymous_donor?
    return true unless user_signed_in?

    params[:anonymous_donor] == 'anonymous'
  end
end
