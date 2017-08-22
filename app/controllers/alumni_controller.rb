class AlumniController < ApplicationController
  def new
    @alumnu = Alumnu.new
    render "new.html.erb"
  end

  def create
    p "hitting the right method!!!!!!!!!!!!!!!!!!!!!!!"
    p alumnu_params
    @alumnu = Alumnu.new(alumnu_params)
    if @alumnu.save
      p @alumnu
      redirect to "alumni/#{@alumnu.id}"
    else
      p "error!!!!!!"
      p @alumnu.errors.full_messages
    end
  end

  def show
    @alumnu = Alumnu.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @alumnu = Alumnu.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    p params
    @alumnu = Alumnu.find_by(id: params[:id])
    @alumnu.update(alumnu_params)
    @user = User.find_by(id: @alumnu.user_id)
    @user.update(user_params)
    if @alumnu.errors.count > 0 || @user.errors.count > 0
      flash[:danger] = @alumnu.errors.full_messages + @user.errors.full_messages
      render "edit.html.erb"
    else
      flash[:success] = "Hooray, updated!!!"
      redirect_to "/alumni/#{@alumnu.id}"
    end
  end

  def alumnu_params
    params.permit(:home_phone, :mobile_phone, :work_phone, :street, :city, :state, :country, :zip_code, :birth_date, :graduation_year, :occupation, :bio).merge(user_id: current_user.id)
  end

  def user_params
    params.permit(:first_name, :middle_initial, :last_name, :email).merge(id: current_user.id)
  end
end
