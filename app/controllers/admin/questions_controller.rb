class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "成功！"
      redirect_to "/admin"
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  

  private
    def question_params
      params.require(:question).permit(:question)
    end


end
