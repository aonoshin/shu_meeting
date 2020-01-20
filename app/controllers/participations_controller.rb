class ParticipationsController < ApplicationController
  

  def index
    
    @boards = current_user.boards
    # offerのみ取得
    @offers = []
    Friend.where(followed_id: current_user.id).order(created_at: :desc).each do |fd|
      if !Friend.find_by('follower_id = ? and followed_id = ?', current_user.id, fd.follower_id)
        # @offersはUserインスタンス群
        @offers.push(User.find_by(id: fd.follower_id))
      end
    end
    
    @participations = Participation.all
    
  end
  
  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      flash[:notice] = "参加表明しました！"
      redirect_to board_path(@participation.board_id)
    else
      flash[:alert] = "参加表明できませんでした"
      redirect_to board_path(@participation.board_id)
    end
    
  end
  
  def destroy
    @participation = Participation.find_by(id: params[:id])
    board_id = @participation.board_id
    if @participation.destroy
      flash[:notice] = "参加表明を取り消しました"
      redirect_to board_path(board_id)
    else
      flash[:alert] = "参加表明を取り消しできませんでした"
      redirect_to board_path(board_id)
    end
  end
  
  private
    def participation_params
        params.require(:participation).permit(:board_id, :user_id).merge(user_id: current_user.id)
    end
  
end
