class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
    @comment = Comment.new
  end

  def new
    authenticate_user!
    @link = Link.new
  end

  def create
    authenticate_user!
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link, notice: "Link posted!"
    else
      flash[:alert] = "Error Occurred"
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
      redirect_to link, notice: "Link updated!"
    else
      flash[:alert] = "An error occurred"
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
