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
    @registrants = Registrant.where(workshop_id: params[:id]).where('registrants.local_school_id = ?', @user.local_school_id)
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
      registrant_ids = []
      @registrants.each do |registrant|
        registrant_ids << registrant.id.to_s
      end
      @registrant_paid = Registrant.where('local_school_id = ? AND workshop_id = ? AND paid = ?', @resource.local_school_id, @workshop.id, false)
      @amount = @workshop.price * @registrant_paid.count
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

  def calc_count_in_show(registrant_workshop)
    count = 0
        # checks if current user is local school admin
    if current_user.local_school_id
      registrant_workshop.each do |registrant_workshop|
        # where the local school id matches
        registrant = Registrant.find_by(id: registrant_workshop.registrant_id)
# counts number of registrants from current user's local school that have a payment status of false
        if registrant.local_school_id == current_user.local_school_id && !registrant_workshop.payment_status
          count += 1
        end
      end
    else
      count += 1
    end
    count
  end
  private

  def workshops_params
    params.require(:workshop).permit(:name, :description, :price, :time)
  end
end
