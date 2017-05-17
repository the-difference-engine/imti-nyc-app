class RegistrantsController < ApplicationController
  def index
    @registrants = Registrant.all
    render 'index.html.erb'
  end

  def new
    @registrant = Registrant.new
  end

  def create
    @registrant = Registrant.new(first_name: params[:first_name], last_name: params[:last_name], affiliation: params[:affiliation], occupation: params[:occupation],  email: params[:email])
    @registrant.save 
  end

  def show
    @registrant = Registrant.find_by(id: params[:id])
    render 'show.html.erb'    
  end

  def edit 
    @registrant = Registrant.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @registrant = Registrant.find_by(id: params[:id])
    @registrant.assign_attributes()
  end

  def destroy 
    
  end
end
