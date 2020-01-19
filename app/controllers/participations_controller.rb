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
    
  end
  
end
