class CalendarController < ApplicationController
  skip_before_action :authenticate_user!

	def show
	    @title = "Calendar"

		render 'show'
	end
end
