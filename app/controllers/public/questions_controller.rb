class Public::QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # @question = Question.find(params[:question_id])
    #@question = Question.find(@answer.question_id)
  end
end
