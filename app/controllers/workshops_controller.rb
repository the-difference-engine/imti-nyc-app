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
<<<<<<< HEAD
    @registrants = @workshop.registrants
        registrant_workshop = RegistrantWorkshop.where(workshop_id: params[:id])
    @workshop = Workshop.find_by(id: params[:id])

    count = calc_count_in_show(registrant_workshop)
    # amount should be changed to workshop price multiplied by count
    @amount = count * @workshop.price.to_f.round(3);
    render 'show.html.erb'  
=======
    @registrant = Registrant.new
    @registrants = @workshop.registrants.where(local_school_id: current_user.local_school_id) if current_user.local_school_admin? 
    render 'show.html.erb'    
>>>>>>> d71e6bc... Allow admin users to view only their registrants
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
    registrant_workshop = RegistrantWorkshop.where(workshop_id: params[:workshop_id] )
    @workshop = Workshop.find_by(id: params[:workshop_id])
  
    count = calc_count_in_payment(registrant_workshop)
    # amount should be changed to workshop price multiplied by count
    @amount = count * @workshop.price.to_i ;
    # binding.pry
    puts "=" *100
    puts "#{@amount} @amount" 
    puts "#{count} count"
    puts "#{@workshop.price.to_i} workshoppirce"
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount * 100,
      :description => "Workshop cost",
      :currency    => 'usd'
      )
    new_charge = current_user.charges.create(uid: charge.id, amount: @amount, description: charge.description, customer_id: customer.id)
    
    flash[:success] = "Thank you for your payment."
    redirect_to workshop_path(params[:workshop_id])

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/workshops/#{params[:workshop_id]}"
  end  

  def calc_count_in_payment(registrant_workshops)
    count = 0
    puts "calc count" + "=="*100 
    # checks if current user is local school admin
    if current_user.local_school_id
      puts "local school?" + "=="*100 
      registrant_workshops.each do |registrant_workshop|
        # where the local school id matches
        registrant = Registrant.find_by(id: registrant_workshop.registrant_id)
        # counts number of registrants from current user's local school that have a payment status of false

          # puts registrant_workshop.payment_status + "=="*100 
        if registrant.local_school_id == current_user.local_school_id && !registrant_workshop.payment_status 
          puts "=="*100
          registrant_workshop.update(payment_status: true)
          count += 1
        end
      end
      # current user is not affiliated with local school
    else 
      count += 1
    end
    count
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
    params.permit(:name, :description, :date, :price)
  end
end
