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

    @charge_uid = stripe_charge.id
    send_confirmation_email(@charge_uid) if email.present?

    flash[:success] = "Thanks you for your donation!"
    redirect_to donations_path
  end

  private

  def send_confirmation_email(charge_uid)
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])

    message_params = {
      from: 'imtinyc@gmail.com',
      to: 'imtinyc@gmail.com',
      subject: 'Your donation has been received',
      text: "Your donation in the amount of $#{amount / 100}.00 was received. For your records, your confirmation number is #{charge_uid}"
    }

    mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params)
  end
end
