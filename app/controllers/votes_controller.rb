class VotesController < ApplicationController

  def new
    authenticate_user!
    @vote = Vote.new
  end

  def create
    authenticate_user!
    @vote = Vote.new
    if @vote.save
      redirect_to :back
    else
      flash[:alert] = "Error Occurred"
      redirect_to :back
    end
  end

end
