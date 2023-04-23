class Admin::AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @questions = Question.all
    # @rankings = {}

    # choices = @questions.map(&:choices).flatten


    # choices.each do |choice|
    #   answers = choice.answers
    #   sorted_answers = answers.sort_by { |answer| -answer.rank } # ランキング順にソートする
    #   @rankings[choice.id] = sorted_answers


    # end

    @all_ranks = @question & Choice.find(Answer.group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))
    # @all_ranks = @question.choices.left_joins(:answers)
    #                 .group(:id)
    #                 .order('COUNT(answers.id) DESC')

    # @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end

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
