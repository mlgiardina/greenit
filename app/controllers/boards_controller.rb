class BoardsController < ApplicationController

  def index
    authenticate_user!
    @boards = Board.all
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
    @link = Link.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "Board was created!"
      redirect_to @board
    else
      flash[:danger] = "An error occurred."
      render :back
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

end
