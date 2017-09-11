class CalendarController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @title = "Calendar"
    @events = Event.all
    render 'show.html.erb'
  end

  def new_event
    render 'new'
  end

  def create
    date = "#{params[:date]['month']}/#{params[:date]['day']}/#{params[:date]['year']}"
    strp_format = "%m/%d/%Y"
    start_time = DateTime.strptime(date, strp_format)
    Event.create(
      title: params[:title],
      location: params[:location],
      start_time: start_time,
      # once we figure out how to add multi-day events, we can update end_time
      end_time: start_time,
      details: params[:details]
    )
    redirect_to '/calendar'
  end
end
