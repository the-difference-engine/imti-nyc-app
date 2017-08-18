class AlumniController < ApplicationController
  def new
    @alumnu = Alumnu.new
    render "new.html.erb"
  end

  def create
    p "hitting the right method!!!!!!!!!!!!!!!!!!!!!!!"
    p alumnu_params
    # @alumnu = Alumnu.new(alumnu_params)
    # if @aumnu.save?

    #   redirect_to ""
  end

  def alumnu_params
    params.permit(:home_phone, :mobile_phone, :work_phone, :street, :city, :state, :country, :zip_code, :birth_date, :graduation_year, :occupation, :bio).merge(user_id: current_user.id)
  end
end
