class FriendsController < ApplicationController
  
  def index
    logger.debug("================= 青野user_id = #{params[:user_id]}")
    @friends = Friend.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end
  
  def show
    @friend = Friend.find(params[:id])
  end
  
  # def create
  #   @user = User.find(params[:friend][:following_id])
  #   current_user.follow!(@user)
  #   respond_to do |format|
  #     format.html {redirect_to @user}
  #     format.js
  #   end
  # end
  
  # def destroy
  #   @user = Friend.find(params[:id]).following
  #   current_user.unfollow!(@user)
  #   respond_to do |format|
  #     format.html {redirect_to @user}
  #     format.js
  #   end
  # end
  
  # def following
  #   @title = "フォロー"
  #   @user = User.find(params[:id])
  #   @users = @user.followings
  #   render "show_follow"
  # end
  
  # def followers
  #   @title = "フォロワー"
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  #   render "show_follow"
  # end
  
  
end
