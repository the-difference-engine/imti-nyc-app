class WorkshopsController < ApplicationController

  def index
    @workshops = Workshop.all
    render 'index.html.erb'
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(first_name: params[:first_name], last_name: params[:last_name], affiliation: params[:affiliation], occupation: params[:occupation],  email: params[:email])
    @workshop.save 
  end

  def show
    @workshop = Workshop.find_by(id: params[:id])
    render 'show.html.erb'    
  end

  def edit 
    
  end

  def update
    
  end

  def destroy 
    
  end

end
