class BoardsController < ApplicationController
  
  def index
    @boards = Board.all.order(day: :asc)
  end
  
  def show
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
    @participation = Participation.new
  end
  
  def new
    @board = Board.new
  end
    
  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "作成しました！"
      redirect_to "/boards/#{@board.id}"
    else
      flash[:alert] = "入力に誤りがあります"
      render "boards/new"
    end
  end
  
  def edit
    @board = Board.find(params[:id])
    if @board.user_id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/users/#{current_user.id}"
    end
  end
  
  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
       flash[:notice] = "編集しました！"
       redirect_to "/boards/#{@board.id}"
    else
       flash[:alert] = "入力に誤りがあります"
       redirect_to "/boards/#{@board.id}/edit"
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
       flash[:notice] = "掲示板を削除しました"
       redirect_to user_path(@board.user_id)
    else
       flash[:alert] = "削除できませんでした"
       redirect_to "users/#{current_user.id}"
    end
  end
  
  private
   def board_params
     params.require(:board).permit(:title, :content, :image, :place, :day, :times, :user_id).merge(user_id: current_user.id)
   end
  
end
