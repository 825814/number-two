class Admin::AnswersController < ApplicationController

  # def index
  #   @question = Question.find(params[:question_id])
  #   @ranking = Answer.ranking(params[:question_id])
  # end

  def index
    @question = Question.find(params[:question_id])
    @questions = Question.all
    # @all_ranks = Choice.find(Answer.group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))
    # 全ての質問に対するランキングが表示される（特別賞）

    # @ranks = @question.choices.joins(:answers).group(:choice_id).order('count(choice_id) desc')
    # @choices = Choice.all

    @answers = @question.answers.includes(:choice)
    #質問に紐付いた回答を取得する
    choice_ids = @answers.group(:choice_id).order('count_choice_id DESC').count(:choice_id).keys
    # choice_ids = @answers.group(:choice_id).order('count_choice_id DESC').limit(5).count(:choice_id).keys
    @all_ranks = Choice.where(id: choice_ids)
    #回答から選択肢のIDを集計し、ランキングを作成する


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

  # def bookmark
  #   answer = Answer.find(params[:id])
  #   answer.update(bookmarked_by_admin: true)
  #   redirect_back(fallback_location: root_path)
  # end

  # def remove_bookmark
  #   answer = Answer.find(params[:id])
  #   answer.update(bookmarked_by_admin: false)
  #   redirect_back(fallback_location: root_path)
  # end
end
