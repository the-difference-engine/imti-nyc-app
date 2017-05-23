class DonationsController < ApplicationController
	skip_before_action :authenticate_user!, except: [:index]

  def new

	end

	def create
		
	end
  
end
