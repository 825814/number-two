class Admin::AnswersController < ApplicationController

  # def index
    def index
      @question = Question.find(params[:question_id])
      @ranks = @question.choices.joins(:answers).group(:choice_id).order('count(choice_id) desc')
    end

    # @question = Question.find(params[:question_id])
    # @questions = Question.all
    # @all_ranks = Choice.find(Answer.group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))


    # @ranks = @question.choices.joins(:answers).group(:choice_id).order('count(choice_id) desc')


    # @answers = Answer.all


    # @all_ranks = Choice.where(question_id: @question.id).joins(:answers).group(:id).order('COUNT(answers.id) DESC')

    # @all_ranks = Choice.where(id: Answer.where(choice_id: @question.choices).group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))
  # end

  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:choice_id])


    # ?他のanswerも全部表示されるAnswer.allだと

    # @answers = @choice.answers
    # @answers = @question.answers
    @answers = @question.answers & @choice.answers
    # この２つをまとめる

# Student.where(gender: "女性").where("age > ?", 16)
    # && @answers =  @choice.answers


  end
end
