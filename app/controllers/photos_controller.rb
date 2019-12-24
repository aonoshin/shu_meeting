class PhotosController < ApplicationController
    
    def index
        logger.debug("================= 青野user_id = #{params[:user_id]}")
        @photos = Photo.where(user_id: params[:user_id])
        @user = User.find(params[:user_id])
    end
    
    def show
        @photo = Photo.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @photo = Photo.new
    end
    
    def create
        @user = User.find_by(id: params[:user_id])
        @photo = Photo.new(photo_params)
        logger.debug("==================== title = #{@photo.title}")
        if @photo.save
            flash[:notice] = "写真をアップしました！"
            redirect_to user_photos_path(@photo.user_id)
        else
            flash[:notice] = "内容に誤りがあります"
            render "photos/new"
        end
    end
    
    def edit
        @user = User.find_by(id: params[:user_id])
        @photo = Photo.find_by(id: params[:id])
    end
    
    def update
        @photo = Photo.find(params[:id])
        @photo.user_id == current_user.id
        if  @photo.update(photo_params)
            flash[:notice] = "写真を編集しました！"
            redirect_to user_photos_path(@photo.user_id)
        else
            flash[:alert] = "無効なユーザー"
            redirect_to "/users/#{@photo.user_id}/photos/#{@photo.id}"
        end
    end
    
    def destroy
        @photo = Photo.find(params[:id])
        @photo.user_id == current_user.id
        if @photo.destroy
           flash[:notice] = "写真を削除しました"
           redirect_to "/users/#{@photo.user_id}/photos"
        else
            flash[:alert] = "無効なユーザー"
            redirect_to "/users/#{@photo.user_id}/photos/#{@photo.id}"
        end
    end
    
    
    private
      def photo_params
          params.require(:photo).permit(:title, :image, :user_id, :content, :place)
      end
    
    
end
