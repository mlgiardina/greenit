class LinksController < ApplicationController
  def index
    authenticate_user!
    @links = Link.all.sort_by { |link| link.votes.count }.reverse
  end

  def show
    authenticate_user!
    @link = Link.find(params[:id])
    @comments = Link.find(params[:id]).comments.sort_by { |comment| comment.votes.count }.reverse
    @comment = Comment.new
    @upvote = Vote.new
    @downvote = Downvote.new
  end

  def new
    authenticate_user!
    @link = Link.new
  end

  def create
    authenticate_user!
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = 'Link was published!'
      redirect_to @link
    else
      flash[:danger] = "Error Occurred"
      render :new
    end
  end

  def edit
    authenticate_user!
    @link = Link.find(params[:id])
  end

  def update
    authenticate_user!
    link = Link.find(params[:id])
    if link.update(link_params)
      flash[:success] = 'Link was updated!'
      redirect_to link
    else
      flash[:danger] = "An error occurred"
      render :edit
    end
  end

  def destroy
    authenticate_user!
    Link.delete(params[:id])
    redirect_to links_path, notice: 'Link deleted!'
  end


  private

  def link_params
    params.require(:link).permit(:body, :user_id, :board_id)
  end
end
