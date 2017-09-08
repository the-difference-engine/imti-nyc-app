class ApplicationsController < ApplicationController
  def index
    @application = current_user.application
  end

  def new
    @user = User.find_by(id: current_user.id)  
  end

  def create
    if current_user.update(user_params)
      application = Application.create(application_status: "pending", user_id: current_user.id)
      redirect_to application_path(application.id)
    else
      flash[:danger] = current_user.errors.full_messages
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
    @amount = @application.user.domestic_applicant? ? 50 : 75;
    render :show
  end

  def payment
    amount = current_user.domestic_applicant? ? 50 : 75;
    application = Application.find(params[:application_id])
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
    application.update(payment_status: true)
    application.update(application_status: "finished")
    flash[:success] = "Thank you for your payment."
    redirect_to application_path(application.id)

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/applications/show"
  end

  def edit
    @user = User.find_by(id: current_user.id)
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    p "we're touching this"
    if current_user.update(user_params)
      flash[:success] = "Application updated."
      redirect_to "/applications/#{@application.id}"
    else
      flash[:danger] = current_user.errors.full_messages
      render :edit
    end
  end

  def completed_applications
    if current_user.role == 'admin'
      @applications_finished = Application.where(application_status: 'finished').paginate(:page => params[:page], :per_page => 15)
      render 'completed_applications'
    else 
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :middle_initial, :phone_number, :street, :city,
    :state, :zip_code, :country, :birth_place, :birth_date,
    :country_of_citizenship, :occupation, :name_of_spouse,
    :ages_of_children)
  end
end
