class FriendsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    # それぞれ該当するものを下記の[]内にidをぶち込む
    @others = []
    @friends = []
    @offers = []
    @requests = []
    
    # 「follower_id = current_user.id」のものを探し出してif文に誘導（友達申請は確実にしている）
    Friend.where(follower_id: current_user.id).each do |fr|
      # 「follower_id = current_user.id」のidがfollower_idとfollowed_idの両方に存在する場合は...
      if Friend.find_by('follower_id = ? and followed_id = ?', fr.followed_id, current_user.id)
        # 「友達」判定
        @friends.push(User.find_by(id: fr.followed_id))
      else
        # そうじゃない場合（「follower_id = current_user.id」のidが、followed_idに存在しない場合）は「友達申請中」判定
        @requests.push(User.find_by(id: fr.followed_id))
      end
    end
    
    # 「followed_id = current_user.id」のものを探し出してif文に誘導（自分にオファーが確実に来ている）
    Friend.where(followed_id: current_user.id).each do |fd|
      # 「followed_id = current_user.id」のidがfollower_idとfollowed_idのどちらにも存在しない場合は...
      if !Friend.find_by('follower_id = ? and followed_id = ?', current_user.id, fd.follower_id)
        # 「オファー中」判定
        @offers.push(User.find_by(id: fd.follower_id))
      end
    end
    
    # @friendsにも@offersにも@requestsにも存在しないidは全て「@others」にぶち込む
    @others = User.where.not(id: @friends).where.not(id: @offers).where.not(id: @requests)
    @others.each do |o|
    end
    
    @user = User.find(params[:user_id])
    @friend = Friend.find_by(follower_id: current_user.id, followed_id: @user.id)
  end
  
  def create
    @user = User.find_by(id: params[:user_id])
    @friend = Friend.new(followed_id: params[:user_id], follower_id: current_user.id)
    if @friend.save
      flash[:notice] = "友達申請を送りました"
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = "友達申請ができませんでした"
      redirect_to "/users/#{@user.id}"
    end
  end
  
  def accept
    @user = User.find_by(id: params[:user_id])
    @friend = Friend.new(followed_id: params[:user_id], follower_id: current_user.id)
    if @friend.save
      flash[:notice] = "友達になりました！！！"
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = "承認できませんでした"
      redirect_to "/users/#{@user.id}"
    end    
  end
  
  def destroy
    @friend = Friend.find_by(followed_id: params[:user_id], follower_id: current_user.id)
    if @friend.destroy
      flash[:notice] = "友達申請を取り止めました"
      redirect_to "/users/#{params[:id]}"
    else
      flash[:notice] = "友達申請解除ができませんでした"
      redirect_to "/users/#{params[:id]}"
    end
  end

  def destroy_sub
    @friend = Friend.find_by(followed_id: params[:user_id], follower_id: current_user.id)
    if @friend.destroy
      flash[:notice] = "友達を解除しました"
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:notice] = "友達解除ができませんでした"
      redirect_to "/users/#{params[:user_id]}"
    end
  end

end