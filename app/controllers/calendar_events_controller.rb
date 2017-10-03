class CalendarEventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_filter :authorize_admin, except: [:index, :show]

  def index
    @title = "Calendar"
    @events = Event.all
    render 'index.html.erb'
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    render 'new.html.erb'
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to calendar_event_path(@event.id)
    else
      flash[:danger] = @event.errors.full_messages
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "New Calendar Event Updated"
      redirect_to calendar_event_path(@event.id)
    else
      flash[:danger] = @event.errors.full_messages
      render :edit
    end

  end

  def destroy
    Event.destroy(params[:id])
    redirect_to calendar_events_path
  end

  private 
  def authorize_admin
    redirect_back fallback_location: calendar_events_path unless current_user.try(:admin?)
  end

  def event_params
    params.require(:event).permit(:title, :details, :location, :start_time, :end_time)
  end
end
