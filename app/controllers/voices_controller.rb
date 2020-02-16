class VoicesController < ApplicationController
    
    before_action :admin_check_redirect
    
    def index
        @voices = Voice.all
        @voices.each do |v|
            # logger.debug("/////////////////////// #{v.id}...#{v.release}")
        end
    end
    
    def show
        render 'admins/nonaccess'
    end
    
    def new
        @voice = Voice.new
    end
    
    def create
        @voice = Voice.new(voice_params)
        logger.debug("////////////////////// release = #{params[:voice][:release]} ")
        if @voice.save
            flash[:notice] = "投稿しました！"
            redirect_to "/voices"
        else
            flash[:alert] = "内容に誤りがあります"
            render "voices/new"
        end
    end
    
    def edit
        @voice = Voice.find(params[:id])
        # if @voice.user_id == current_user.id
        # else
        #     flash[:alert] = "無効なユーザー"
        #     redirect_to "/"
        # end
    end
    
    def update
        @voice = Voice.find(params[:id])
        if @voice.update(voice_params)
            flash[:notice] = "内容を変更しました！"
            redirect_to "/voices"
        else
            flash[:alert] = "内容に誤りがあります"
            render "/voices/#{@voice.id}"/edit
        end
    end
    
    def destroy
        @voice = Voice.find(params[:id])
        if @voice.destroy
            flash[:notice] = "削除しました！"
            redirect_to "/voices"
        else
            flash[:alert] = "削除できませんでした"
            redirect_to "/voices"
        end
    end
    
    private
      def voice_params
          params.require(:voice).permit(:name, :age, :area, :image, :content, :user_id, :release)
      end
    
    
end
