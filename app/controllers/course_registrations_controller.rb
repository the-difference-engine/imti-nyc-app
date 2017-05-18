class CourseRegistrationsController < ApplicationController

	def new
		@courses = Course.all
	end

	def create
		course = Course.find(course_registration_params[:course_id])
		amount = (course.price * 100).to_i
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => course.name,
      :currency    => 'usd'
    )

    @new_charge = current_user.charges.create(uid: charge.id, amount: charge.amount / 100, description: charge.description, customer_id: customer.id)
    current_user.update(course_id: course.id)
    render "show.html.erb"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/course_registrations/new"
	end

	def course_registration_params
		params.require(:course).permit(:course_id).merge(user_id: current_user.id)
	end
end
