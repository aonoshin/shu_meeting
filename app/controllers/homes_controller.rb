class HomesController < ApplicationController
  
  def top
    @voices = Voice.all.order(updated_at: :desc)
    @news = News.all.order(updated_at: :desc)
  end
  
  def new
    @home = Home.new
  end
  
  def create
    @home = Home.new(home_what_params)
    # 本来ならアプリ作成者のみが編集可能になる
    if @home.save
      flash[:notice] = "投稿しました"
      redirect_to "/"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "homes/new"
    end
  end
  
  def edit
    @home = Home.find_by(id: params[:id])
  end
  
  def update
    @home = Home.find_by(id: params[:id])
    if @home.update(home_what_params)
      flash[:notice] = "編集しました！"
      redirect_to "/"
    else
      flash[:alert] = "入力に誤りがあります"
      render "homes/#{@home.id}/edit"
    end
  end
  
  def destroy
    @home = Home.find_by(id: params[:id])
    if @home.destroy
      flash[:notice] = "削除しました"
      redirect_to "/"
    else
      flash[:alert] = "削除できません"
      redirect_to "/"
    end
  end
  
  
  private
    def home_what_params
      params.require(:home).permit(:name, :age, :area, :image, :content, :news, :day)
    end
end
