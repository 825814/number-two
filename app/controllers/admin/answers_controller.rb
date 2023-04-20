class Admin::AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])

    # @choice = Choice.find(params[:choice_id])
    @choices = Choice.all
  end

  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:choice_id])
    # ?他のanswerも全部表示される　Answer.allだと
    @answers = @choice.answers
  end
end
