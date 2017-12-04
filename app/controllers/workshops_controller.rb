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
    @user = current_user.presence || User.new
    @registrant = Registrant.new
    @registrants = find_registrants(@workshop.id)
    if user_signed_in? && current_user.local_school_admin?
      @resource = current_user
      @registrants = @workshop.registrants.where(local_school_id: current_user.local_school_id)
      @amount = @workshop.price * @registrants.count
    else
      @resource = Registrant.find_by(id: params[:resource])
      @amount = @workshop.price
    end
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
    @workshop = Workshop.find_by(id: params[:id])
    if user_signed_in? && current_user.local_school_admin?
      @resource = current_user
      @registrants = @workshop.registrants.where(local_school_id: current_user.local_school_id)
      @amount = @workshop.price * @registrants.count
    else
      @resource = Registrant.find_by(id: params[:resource])
      @amount = @workshop.price
    end
    redirect_to workshop_path(params[:id]) and return unless @resource.present?
  end

  def pay
    workshop = Workshop.find_by(id: params[:id])
    if user_signed_in? && current_user.local_school_admin?
      registrants = workshop.registrants.where(local_school_id: current_user.local_school_id)
      amount = registrants.count * workshop.price.to_i
      resource = current_user
    else
      amount = workshop.price
      resource = Registrant.find_by(id: params[:resource_id])
    end

    customer = Stripe::Customer.create(
      email: resource.email,
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      amount * 100,
      description: "Workshop cost",
      currency:    'usd'
    )

    imti_charge = Charge.new(uid: charge.id, amount: amount, description: charge.description, customer_id: customer.id, charge_type: 'workshop')
    if resource.is_a?(User)
      registrants.update_all(paid: true)
      imti_charge.user_id = resource.id
    else
      resource.update(paid: true)
      imti_charge.registrant_id = resource.id
    end
    imti_charge.save

    flash[:success] = "Thank you for your payment."
    redirect_to workshop_path(workshop.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to workshop_path(workshop.id)
  end

  private

  def find_registrants(workshop_id)
    return unless user_signed_in? && current_user.local_school_admin?

    current_user.local_school.registrants.where(workshop_id: workshop_id)
  end

  def workshops_params
    params.require(:workshop).permit(:name, :description, :price, :time)
  end
end
