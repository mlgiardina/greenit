class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path, notice: "Account created!"
    else
      flash[:alert] = "Errors Occurred."
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
