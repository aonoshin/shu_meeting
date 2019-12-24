class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to user_path(@post.user_id)
    else
      flash[:alert] = "入力に誤りがあります"
      render "posts/new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.user_id == current_user.id
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました！"
      redirect_to "/users/#{@post.user_id}"
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to "/posts/#{@post.id}/edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.user_id == current_user.id
    if @post.destroy
       flash[:notice] = "投稿を削除しました"
       redirect_to user_path(@post.user_id)
    else
       flash[:notice] = "無効なユーザー"
       render "users/#{current_user.id}"
    end
  end
  
  private
   def post_params
     params.require(:post).permit(:title, :content, :image, :movie, :place, :user_id).merge(user_id: current_user.id)
   end
  
end
