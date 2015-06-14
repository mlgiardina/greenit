class DownvotesController < ApplicationController
   def new
    authenticate_user!
    @downvote = Downvote.new
  end

  def create
    authenticate_user!
    @downvote = Downvote.new(downvote_params)
    if @downvote.save
      flash[:success] = "reddit recorded."
      redirect_to :back
    else
      flash[:danger] = "Error Occurred"
      redirect_to :back
    end
  end

  private

  def downvote_params
    params.require(:downvote).permit(:user_id, :comment_id, :link_id)
  end
end
