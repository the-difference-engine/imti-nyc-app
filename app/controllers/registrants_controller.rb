require 'roo'
class RegistrantsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @registrant = Registrant.new
  end

  def create
    @registrant = Registrant.new(registrants_params)
    @registrant.local_school_id = current_user.local_school_id if current_user && current_user.local_school_admin?
    if @registrant.save
      RegistrantWorkshop.create(registrant_id: @registrant.id, workshop_id: params[:workshop_id])
      flash[:success] = "Registrant has been created"
      redirect_to workshop_path(params[:workshop_id])
    else
      @workshop = Workshop.find_by(id: params[:workshop_id])
      if current_user && current_user.local_school_admin?
        @registrants = @workshop.registrants.where(local_school_id: current_user.local_school_id)
      end
      flash[:danger] = @registrant.errors.full_messages
      render 'workshops/show'

    end
  end

  def import
    Registrant.import(params[:file], params[:workshop_id], current_user.local_school_id)
    redirect_to workshop_path(params[:workshop_id]), notice: "Your import was succesful!"
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
