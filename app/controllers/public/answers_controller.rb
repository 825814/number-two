class Public::AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:question_id])
    # @answer = Answer.new
  end
end
