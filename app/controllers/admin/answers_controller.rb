class Admin::AnswersController < ApplicationController
before_action :authenticate_admin!

  def index
    @question = Question.find(params[:question_id])
    # @all_ranks = Choice.find(Answer.group(:choice_id).order('count(choice_id) desc').pluck(:choice_id))
    # 全ての質問に対するランキングが表示される（特別賞）
    @answers = @question.answers.includes(:choice)
    #質問に紐付いた回答を取得する
    # choice_ids = @answers.group(:choice_id).order('count_choice_id DESC').count(:choice_id).keys
    # @all_ranks = Choice.where(id: choice_ids)
    # 失敗。このとき、count_choice_id カラムは存在しないためランキングができない

    #回答から選択肢のIDを集計し、ランキングを作成する
    choice_ids = @answers.group(:choice_id).order('count(choice_id) DESC').count.keys
    @all_ranks = Choice.where(id: choice_ids).sort_by { |choice| choice_ids.index(choice.id) }
    # count(choice_id) を使用して選択肢のIDを集計し、正しい順序で並び替える。
    # Choice.where で取得した選択肢を
    # sort_by メソッドを使用して
    # choice_ids の順序に並び替えている。
  end


  def show
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:choice_id])
    # ?他のanswerも全部表示されるAnswer.allだと
    # @answers = @choice.answers
    # @answers = @question.answers
    @answers = @question.answers & @choice.answers
    # この２つをまとめる
    @favorite_comments = current_admin.favorites.map{ |f| f.answer.comment }.compact
    @comments = @answers.map(&:comment) & @favorite_comments
  end


end
