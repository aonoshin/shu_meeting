class MessagesController < ApplicationController
  
  def index
    @friend = Friend.find(params[:friend_id])
    # ↑messagesのfriend_idを@friendに入れる
    @partner = Friend.find_by(followed_id: @friend.follower_id, follower_id: @friend.followed_id)
    # ↑相手のidは申請した側とされた側の2パターンが考えられるため
    @user = User.find(@friend.followed_id)
    # ↑「followed_id = フォローしているユーザー」そのユーザーのidの名前を検索する
    @messages = Message.where(friend_id: @friend.id).or(Message.where(friend_id: @partner.id))
    # @messages.each do |m|
    #       logger.debug("-------------------------- index m.content = #{m.content}")
    # end
    @message = Message.new
    # ↑index内に送信エリアがあるため。
  end
  
  def create
    @friend = Friend.find_by(id: params[:friend_id])
    # ↑誰と誰のチェットかを判断している。
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージを送信しました！"
      redirect_to friend_messages_path(@friend.id)
    else
      flash[:alert] = "送信できませんでした"
      redirect_to friend_messages_path(@friend.id)
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      flash[:notice] = "削除しました"
      redirect_to friend_messages_path(@message.friend_id)
    else
      flash[:alert] = "削除できませんでした"
      redirect_to friend_messages_path(@message.friend_id)
    end
  end
  
  
  private
    def message_params
      params.require(:message).permit(:content, :friend_id)
    end
    
end