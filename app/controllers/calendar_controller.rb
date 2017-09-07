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
		# date = "#{params[:date]["day"]}/#{params[:date]["month"]}/#{params[:date]["year"]}"
		@day = "#{params[:date]["day"]}"
		@month = "#{params[:date]["month"]}"
		@year = "#{params[:date]["year"]}"
		@date = "#{day}"+"/"+"#{month}"+"/"+"#{year}"
		# strp_format = "%d%m%Y"
		strp_format = "%@day%@month%@year"
		start_date = DateTime.strptime(date, strp_format)

		Event.create(
			title: params[:title],
			location: params[:location],
			# start_date: start_date,
			# end_date: start_date,
			# CHANGE THIS TO END_DATE
			# details: params[:details],
		)
		redirect_to '/calendar#show'
	end
end
