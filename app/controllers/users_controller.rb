class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @boards = Board.where(user_id: @user.id).order(day: :asc)
        @posts = Post.where(user_id: @user.id).order(created_at: :desc)
        @friends = Friend.where(user_id: @user.id).order(created_at: :desc)
    end
    
    def new
        @user = User.new
    end
    
    def edit
        @user = User.find(params[:id])
        if @user.id == current_user.id
        else
            redirect_to "/"
            flash[:alert] = "無効なユーザー"
        end
    end
    
    def update
        @user = User.find(params[:id])
        @user.id == current_user.id
        if @user.update(user_params)
            flash[:notice] = "プロフィールを編集しました！"
            redirect_to "/users/#{@user.id}"
        else
            flash[:alert] = "入力に誤りがあります"
            redirect_to "/users/#{@user.id}/edit"
        end
    end
    
    private
      def user_params
          params.require(:user).permit(:name, :age, :icon, :area, :gender, :profile, :hobby)
      end
    
    def destroy
        @user = User.find(params[:id])
        @user.id == current_user.id
        if @user.destroy
            flash[:notice] = "退会手続きが完了しました"
            redirect_to "/"
        else
            flash[:alert] = "無効なユーザー"
            redirect_to "/"
        end
    end
    
end
