class CalendarEventsController < ApplicationController
  skip_before_action :authenticate_user!
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
    # TODO - change start and end time here.
    event_params = params[:event]

    Event.create(
          title: event_params[:title],
          location: event_params[:location],
          start_time: Time.zone.local(event_params["start_time(1i)"].to_i, event_params["start_time(2i)"].to_i, 
                 event_params["start_time(3i)"].to_i, event_params["start_time(4i)"].to_i, 
                 event_params["start_time(5i)"].to_i),
          end_time:   Time.zone.local(event_params["end_time(1i)"].to_i, event_params["end_time(2i)"].to_i, 
                 event_params["end_time(3i)"].to_i, event_params["end_time(4i)"].to_i, 
                 event_params["end_time(5i)"].to_i),
          # once we figure out how to add multi-day events, we can update end_time
          # end_time: event_params[:end_time],
          details: event_params[:details]
          )
    redirect_to '/calendar'
  end

  def update
    event = Event.find(params[:id])
    event_params = params[:event]
    # binding.pry

    Event.find(params[:id])
         .update(
          title: event_params[:title],
          location: event_params[:location],
          start_time: DateTime.new(event_params["start_time(1i)"].to_i, event_params["start_time(2i)"].to_i, 
                 event_params["start_time(3i)"].to_i, event_params["start_time(4i)"].to_i, 
                 event_params["start_time(5i)"].to_i),
          end_time:   DateTime.new(event_params["end_time(1i)"].to_i, event_params["end_time(2i)"].to_i, 
                 event_params["end_time(3i)"].to_i, event_params["end_time(4i)"].to_i, 
                 event_params["end_time(5i)"].to_i),
          # once we figure out how to add multi-day events, we can update end_time
          # end_time: event_params[:end_time],
          details: event_params[:details]
          )
    redirect_to calendar_event_path(event.id)
  end

  def delete
  end
end
