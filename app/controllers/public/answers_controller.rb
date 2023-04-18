class Public::AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    @answer.choice_id = params[:choice_id]
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/complete")
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  def confirm
    @answers = current_user.answers
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
   
  end

private
  def answer_params
    params.require(:answer).permit(:comment, :choice_id, :question_id)
  end

end
