class UsersController < ApplicationController
    
    before_action :authenticate_user!
    before_action :admin_check_redirect, only: [:index]
    
    def index
        @users = User.all.order(created_at: :asc)
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
            flash[:alert] = "無効なユーザー"
            redirect_to "/users/#{current_user.id}"
        end
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "プロフィールを編集しました！"
            redirect_to "/users/#{@user.id}"
        else
            flash[:alert] = "入力に誤りがあります"
            redirect_to "/users/#{@user.id}/edit"
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.id == current_user.id
            @user.destroy
            # @friend.destroy
            flash[:notice] = "退会手続きが完了しました"
            redirect_to "/"
        else
            flash[:alert] = "無効なユーザー"
            redirect_to "/"
        end
    end
    
    private
      def user_params
          params.require(:user).permit(:name, :age, :icon, :area, :gender, :profile, :hobby)
      end
    
    
    # ↓メールフォーマット-----------------------------------------------------------
    # def create
    #     @user = User.new(user_params)
    #     respond_to do |format|
    #         if @user.save
    #             shu_meeting_mail.send_when_create(@user).deliver
    #             format.html { redirect_to @user, notice: 'User was successfully created.' }
    #             format.json { render :show, status: :created, location: @user }
    #         else
    #             format.html { render :new }
    #             format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end
    
end
