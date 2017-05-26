require 'roo'
class RegistrantsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @registrant = Registrant.new
  end

  def create
    registrant = Registrant.new(registrants_params)
    registrant.save 
    RegistrantWorkshop.create(registrant_id: registrant.id, workshop_id: params[:workshop_id])
    redirect_to "/workshops"
  end

  def import
    Registrant.import(params[:file], params[:workshop_id])
    redirect_to "/local_schools", notice: "Your import was succesful!"
  end

  def edit 
    @registrant = Registrant.find_by(id: params[:id])
    @registrant.update(registrants_params)
    render 'edit.html.erb'
  end

  private

  def registrants_params
    params.permit(:first_name, :last_name, :affiliation, :occupation, :email, :phone)
  end 
end
