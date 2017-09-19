class CalendarController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @title = "Calendar"
    @events = Event.all
    render 'show.html.erb'
  end
end
