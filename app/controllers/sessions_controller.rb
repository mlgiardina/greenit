class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_url
    else
      flash[:danger] = "Username or Password did not match."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Successfully logged out. Goodbye!"
  end
end
