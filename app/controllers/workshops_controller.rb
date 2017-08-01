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
    @registrant = Registrant.new
    @registrants = @workshop.registrants.where(local_school_id: current_user.local_school_id) if current_user.local_school_admin? 
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

  private

  def workshops_params
    params.permit(:name, :description, :date, :price)
  end
end
