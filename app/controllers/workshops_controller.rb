class WorkshopsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @workshops = Workshop.all
    render 'index.html.erb'
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshops_params)
    @workshop.save
    redirect_to "/workshops"
  end

  def show
    @workshop = Workshop.find_by(id: params[:id])
    @registrants = @workshop.registrants
    render 'show.html.erb'    
  end

  def edit 
    @workshop = Workshop.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @workshop = Workshop.find_by(id: params[:id])
    @workshop.update(workshops_params)
    redirect_to "/workshops/#{@workshop.id}"
  end

  def destroy 
    @workshop = Workshop.find_by( id: params[:id]) 
    @workshop.destroy
    redirect_to "/workshops"
  end

  def payment
    amount = current_user.domestic_applicant? ? 50 : 75;
    registrantWorkshop = RegistrantWorkshop.where(workshop_id: params[:id])
    
    count = 0
    registrantWorkshop.each do |registrant_workshop|
      # where the local school id matches
      registrant = Registrant.find_by(id: registrant_workshop.registrant_id)
      if registrant.local_school_id == current_user.id
        registrant_workshop.update(payment_status: true)
        count += 1
      end
    end

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount * 100,
      :description => "Application fee",
      :currency    => 'usd'
      )

    new_charge = current_user.charges.create(uid: charge.id, amount: amount, description: charge.description, customer_id: customer.id)
    
    flash[:success] = "Thank you for your payment."
    redirect_to workshop_path(params[:workshop_id])

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/workshops/#{params[:workshop_id]}"
  end  

  private

  def workshops_params
    params.permit(:name, :description, :date, :price)
  end
end
