class CommentsController < ApplicationController

  def create
    authenticate_user!
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash[:alert] = "An Error Occurred."
      render :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :link_id)
  end

end
