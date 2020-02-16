class AnswersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check_redirect
  
  def index
    @answers = Answer.where(id: params[:inquiry_id])
    @inquiry = Inquiry.find(params[:inquiry_id])
  end
  
  def show
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer = Answer.find(params[:id])
  end
  
  def new
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer = Answer.new
  end
  
  def create
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if current_user.id == 0
        if @answer.save
          AnswerMailer.send_when_create_admin(@answer).deliver
          AnswerMailer.send_when_create(@answer).deliver
          format.html { redirect_to "/inquiries/#{@inquiry.id}", notice: '回答しました！' }
          format.json { render "inquiries/new", status: :created, location: @answer }
        else
          format.html { redirect_to "/inquiries/#{@inquiry.id}/answers/new", alert: '入力内容に誤りがあります。' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      else
        flash[:alert] = "無効なユーザー"
        redirect_to "/"
      end
    end
  end
  
  def destroy
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer = Answer.find(params[:id])
    if current_user.id == 0
      @answer.destroy
      flash[:notice] = "回答を削除しました！"
      redirect_to "/inquiries/#{@inquiry.id}"
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/"
    end
  end
  
  
  private
    def answer_params
      params.require(:answer).permit(:answer, :inquiry_id, :email)
    end
  
  
end
