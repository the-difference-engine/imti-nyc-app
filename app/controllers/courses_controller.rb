class CoursesController < ApplicationController
  skip_before_filter :authenticate_user!

	def index
	  @courses = Course.all
	end

	def show
	  @course = Course.find(params[:id])
	end
end
