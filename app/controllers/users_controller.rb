class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Account created"
      redirect_to root_path
    else
      flash[:danger] = "Errors Occurred."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @votes = @user.votes.pluck(:id)
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
