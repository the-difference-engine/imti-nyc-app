class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @donation = Donation.new
  end
  def show
    @charge = Donation.find_by_uid(params[:id])
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge= Stripe::Charge.create(
      :amount => (params[:amount].to_i)*100,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "Donation")
    Donation.find(params[:donation_id]).update(confirmed: true)
    new_charge= Charge.new(customer_id: customer.id, 
                                 amount: params[:amount].to_i,
                                 uid: SecureRandom.uuid,
                                 payment_id: params[:donation_id],
                                 currency: charge.currency, 
                                 card: params[:stripeToken])
    new_charge.user_id =  current_user  ? current_user.id : nil
    new_charge.description =  current_user  ? charge.description : "anonymous"
    new_charge.save

    Donation.find(params[:donation_id]).update(confirmed: true)

    redirect_to donation_path(Donation.all.where(email:params[:stripeEmail]).last.uid)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def confirmation
    @donation = Donation.new(donation_params)
    @donation.uid = SecureRandom.uuid

    @donation.first_name = current_user ? current_user.first_name : "anonymous"
    @donation.last_name = current_user ? current_user.last_name : "anonymous"
    @donation.user_id =  current_user  ? current_user.id : nil

    if @donation.amount.to_f  >= Donation::MINIMUN_AMOUNT
      @donation.save
  else
    flash[:danger] = "Provide an amount greater than or equal to #{amount}."
    render 'new.html.erb'
    end
  end

  private

    def donation_params
      params.permit(:donation_id, :first_name, :last_name, :email, :comment, :amount, :uid, :confirmed, :amount)
    end

end

