class RegistrantsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @registrant = Registrant.new
  end

  def create
    registrant = Registrant.new(first_name: params[:first_name], last_name: params[:last_name], affiliation: params[:affiliation], occupation: params[:occupation],  email: params[:email], phone: params[:phone])
    registrant.save 
    RegistrantWorkshop.create(registrant_id: registrant.id, workshop_id: params[:workshop_id])
    redirect_to "/workshops"
  end

  def edit 
    @registrant = Registrant.find_by(id: params[:id])
    @registrant.update(first_name: params[:first_name], last_name: params[:last_name], affiliation: params[:affiliation], occupation: params[:occupation],  email: params[:email])
    render 'edit.html.erb'
  end
end
