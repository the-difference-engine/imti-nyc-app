class AlumniController < ApplicationController
  def new
    @user = User.find_by(id: current_user.id)
  end

  def create
    @alum = current_user.update(user_params)
    if @alum.update(user_params)
      redirect_to alumni_path(@alum.id)
    else
      flash[:danger] = current_user.errors.full_messages
      render "new.html.erb"
    end
  end

  def show
    param_user = User.find_by(id: params[:id])
    if param_user.role == 'alumni'
      if current_user.id == param_user.id || current_user.role == 'admin'
        @alum = param_user
        render "show.html.erb"
      else
        redirect_to "/"
        flash[:danger] = "You do not have access to this user's page."
      end
    else
      redirect_to "/"
      flash[:danger] = "Page not found"
    end
  end

  def edit
    param_user = User.find_by(id: params[:id])
    if param_user.role == 'alumni'
      if current_user.id == param_user.id || current_user.role == 'admin'
        @alum = param_user
        render "edit.html.erb"
      else
        redirect_to "/"
        flash[:danger] = "You do not have access to this user's page."
      end
    else
      redirect_to "/"
      flash[:danger] = "Page not found"
    end
  end

  def update
    @alum = User.find_by(id: params[:id])
    if @alum.update(user_params)
      flash[:success] = "Alumni info has been updated!"
      redirect_to "/alumni/#{@alum.id}"
    else
      flash[:danger] = @alum.errors.full_messages
      render "edit.html.erb"
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :middle_initial, :phone_number, :street, :city,
    :state, :zip_code, :country, :birth_place, :birth_date,
    :country_of_citizenship, :occupation, :name_of_spouse,
    :ages_of_children)
  end
end
