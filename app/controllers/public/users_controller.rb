class Public::UsersController < ApplicationController
  def show
    @answers = current_user.answers
    # @answer = current_user.answer
    # @question = @answer.question_id
  end

  # def edit
  #   # @question = Question.find(params[:question_id])
  #   # @answer = Answer.find(params[:id])

  #   @question = current_user.questions.find(params[:question_id])
  #   @answer = current_user.answers.find(params[:id])

  # end

  # def update
  #   @answer = current_user.answers.find(params[:id])
  #   # @answer.user_id = current_user.id
  #   # @answer.question_id = params[:answer][:question_id]
  #   # @answer.choice_id = params[:answer][:choice_id]

  #   if @answer.update(answer_params)
  #     redirect_to users_my_page_path
  #     flash[:notice] = "回答を変更しました。"
  #   else
  #     flash.now[:alert] = "失敗！"
  #     render "new"
  #   end
  # end

  # private
  #   def answer_params
  #     params.require(:answer).permit(:question_id, :comment, :choice_id, :user_id)
  #   end

end
