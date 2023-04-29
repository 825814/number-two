# キーワード検索
class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @questions = Question.looks(params[:search], params[:word])
    elsif
      @answers = Answer.looks(params[:search], params[:word])
    else
      @choices = Choice.looks(params[:search], params[:word])
    end

  end

end
