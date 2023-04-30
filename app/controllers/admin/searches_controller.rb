class Admin::SearchesController < ApplicationController
  def index
    @questions = Question.where('question LIKE ?', "%#{params[:keyword].split.join('%')}%")
    @answers = Answer.where('comment LIKE ?', "%#{params[:keyword].split.join('%')}%")
    @choices = Choice.where('choice LIKE ?', "%#{params[:keyword].split.join('%')}%")
  end
end
