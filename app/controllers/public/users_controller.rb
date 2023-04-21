class Public::UsersController < ApplicationController
  def show
    @answers = current_user.answers
    # @answer = current_user.answer
    # @question = @answer.question_id
  end

  def edit
    # @question = Question.find(params[:question_id])
  end

end
