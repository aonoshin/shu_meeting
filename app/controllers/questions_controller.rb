class QuestionsController < ApplicationController
  
  before_action :admin_check_redirect, except: :index
  before_action :authenticate_user!, except: :index
  
  def index
    @questions = Question.all.order(updated_at: :desc)
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "投稿しました！"
      redirect_to "/questions"
    else
      flash[:alert] = "入力に誤りがあります"
      render "questions/new"
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "編集しました！"
      redirect_to "/questions"
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to "/questions/#{@question.id}/edit"
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/questions"
    else
      flash[:alert] = "削除できませんでした"
      redirect_to "/questions"
    end
  end
  
  
  
  private
    def question_params
      params.require(:question).permit(:qcontent, :atext, :acontent, :number)
    end
  
  
  
end
