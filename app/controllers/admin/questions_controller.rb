class Admin::QuestionsController < ApplicationController
  before_action :check_answer_existence, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "成功！"
      redirect_to "/admin/admin"
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "成功"
      redirect_to admin_admin_path
    else
      flash.now[:alert] = "失敗"
      render "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy!
      flash[:notice] = "成功"
      redirect_to admin_admin_path
    else
      render admin_admin_path
      flash.now[:alert] = "失敗"
    end
  end
  
  def index
    @questions = Question.where('question LIKE ?', "%#{params[:keyword].split.join('%')}%")
  end

  private
    def question_params
      params.require(:question).permit(:question)
    end

    def check_answer_existence
      @question = Question.find(params[:id])
      if @question.answers.exists?
        flash[:alert] = "この質問には既に回答が存在するため、編集や削除はできません。"
        redirect_to admin_admin_path
      end
    end

    

end
