class NewsController < ApplicationController
    
    before_action :admin_check_redirect
    
    def index
        @news = News.all.order(created_at: :desc)
    end

    def show
        render 'admins/nonaccess'
    end
    
    def new
        @news = News.new
    end
    
    def create
        @news = News.new(news_params)
        if @news.save
            flash[:notice] = "投稿しました！"
            redirect_to "/news"
        else
            flash[:alert] = "内容に誤りがあります"
            render "news/new"
        end
    end
    
    def edit
        @news = News.find(params[:id])
        # if @news.user_id == current_user.id
        # else
        #     flash[:alert] = "無効なユーザー"
        #     redirect_to "/"
        # end
    end
    
    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
            flash[:notice] = "内容を変更しました！"
            redirect_to "/news"
        else
            flash[:alert] = "内容に誤りがあります"
            redirect_to "/news/#{@news.id}/edit"
        end
    end
    
    def destroy
        @news = News.find(params[:id])
        if @news.destroy
            flash[:notice] = "削除しました！"
            redirect_to "/news"
        else
            flash[:alert] = "削除できませんでした"
            redirect_to "/news"
        end
    end
    
    private
      def news_params
          params.require(:news).permit(:content, :user_id, :release)
      end
end
