class Admin::AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    # @answers = @question.answers
    @answers = @question.answers
    @all_ranks = Choice.find(Answer.group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))
    # @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end

  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:choice_id])
    
    
    # ?他のanswerも全部表示されるAnswer.allだと
    # @choices = @question.choices
    # @answers = @choice.answers
    @answers = @question.answers
    # && @answers =  @choice.answers


  end
end
