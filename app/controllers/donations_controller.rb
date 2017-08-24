class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @donation = Donation.new
  end
  def show
    @charge = Donation.find(params[:id])
  end
  def create
    puts "helloooo"
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    if current_user
      charge= Stripe::Charge.create(
      :amount => (current_user.donations.last.amount*100).to_i,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "Donation")
      current_user.donations.last.update(confirmed: true)
   else
      # binding.pry
      charge= Stripe::Charge.create(
      :amount => (Donation.all.where(email:params[:stripeEmail]).last.amount*100).to_i,
      :currency => "usd",
      :source => "tok_visa", # obtained with Stripe.js
      :description => "anonymous donation")
    end
    Donation.all.where(email:params[:stripeEmail]).last.update(email: params[:stripeEmail],confirmed: true)
    payment= Charge.create(customer_id: customer.id, 
                               description: charge.description,
                               amount: (Donation.all.where(email:params[:stripeEmail]).last.amount).to_i,
                               uid: SecureRandom.uuid)
    redirect_to donation_path(Donation.all.where(email:params[:stripeEmail]).last.id)
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
  def confirmation
    amount = 5
    if current_user
      @donation = Donation.new(
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      email:current_user.email,
      comment: params[:comment],
      amount: params[:amount],
      user_id: current_user.id,
      confirmed: false)
   else
     @donation = Donation.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email:params[:email],
      comment: params[:comment],
      amount: params[:amount],
      confirmed: false)
    end
  # @donation = Donation.new(
  #     first_name: params[:first_name],
  #     last_name: params[:last_name],
  #     email: params[:email],
  #     comment: params[:comment],
  #     amount: params[:amount],
  #     user_id: current_user.id,
  #     confirmed: false
  #   )
  # binding.pry
    if @donation.amount.to_f  >= amount
      @donation.save
    else
      flash[:danger] = "Provide an amount greater than or equal to #{amount}."
      render 'new.html.erb'
    end

  end
end
