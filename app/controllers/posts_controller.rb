class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.order(updated_at: :desc)
    # @post = Post.find(params[:user_id])
  end
  
  def show
    render 'admins/nonaccess'
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to "/posts"
    else
      flash[:alert] = "入力に誤りがあります"
      render "posts/new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/users/#{current_user.id}"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました！"
      redirect_to "/users/#{@post.user_id}"
    else
      flash[:alert] = "入力に誤りがあります"
      render "/posts/#{@post.id}/edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
       flash[:notice] = "投稿を削除しました"
       redirect_to "/posts"
    else
       flash[:alert] = "削除できませんでした"
       redirect_to "users/#{current_user.id}"
    end
  end
  
  private
   def post_params
     params.require(:post).permit(:title, :content, :image, :movie, :place, :user_id).merge(user_id: current_user.id)
   end
  
end
