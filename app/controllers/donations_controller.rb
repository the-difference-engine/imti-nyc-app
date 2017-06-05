class DonationsController < ApplicationController
	skip_before_action :authenticate_user!, except: [:index]

  def new
    @donation = Donation.new
	end

	def create
		@donation = Donation.new( 
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      comment: params[:comment]
      )

    if params[:other_amount].to_i > 0
      @donation.amount = params[:other_amount]
    else
      @donation.amount = params[:amount]
    end

    if @donation.save
      redirect_to "/donations/#{@donation.id}" 
      flash[:success] = "Donation Confirmed!"
    else
      redirect_to "/donations/new"
      flash[:danger] = @donation.errors.full_messages
    end
	end

  def show
    @donation = Donation.find_by(id: params[:id])
  end
  
  private

  def donation_params
    params.require(:donation).permit(:first_name, :last_name, :email, :comment)
    
  end
end
