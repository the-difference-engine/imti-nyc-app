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
    @workshop = Workshop.new(name: params[:name], description: params[:description], date: params[:date], price: params[:price])
    @workshop.save 
    redirect_to "/workshops"
  end

  def show
    @workshop = Workshop.find_by(id: params[:id])
    render 'show.html.erb'    
  end

  def edit 
    @workshop = Workshop.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @workshop = Workshop.find_by(id: params[:id])
    @workshop.update(name: params[:name], description: params[:description], date: params[:date], price: params[:price])
    redirect_to "/workshops/#{@workshop.id}"
  end

  def destroy 
    @workshop = Workshop.find_by( id: params[:id]) 
    @workshop.destroy
    redirect_to "/workshops"
  end  
end
