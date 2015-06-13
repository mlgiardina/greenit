class VotesController < ApplicationController

  def new
    authenticate_user!
    @vote = Vote.new
  end

  def create
    authenticate_user!
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to :back
    else
      flash[:alert] = "Error Occurred"
      redirect_to :back
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :comment_id, :link_id)
  end

end
