class Public::AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @user = current_user

    # @question_1 = Question.find(1)
    # @question_2 = Question.find(2)
  end

  def create
    # @question = Question.find(params[:question_id])
    # @answer = current_user.answers.new(answer_params)
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id

    @answer.question_id = params[:answer][:question_id]
    @answer.choice_id = params[:answer][:choice_id]

    if @answer.save!
      flash[:notice] = "成功！"
      # redirect_to complete_path
       redirect_to questions_path
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  # def confirm
  #   ## @answers = current_user.answers
  #   @answer = Answer.new(answer_params)
  #   @question = Question.find(@answer.question_id)
  # end

  # def destroy
  #   @answer = Answer.new(answer_params)
  #   @answer.user_id = current_user.id
  #   @answer.question_id = params[:answer][:question_id]
  #   @answer.choice_id = params[:answer][:choice_id]

  #   @answer.destroy
  #     redirect_to questions_path
  #     flash[:notice] = "すでに回答済みのため、この回答は無効です。"
  # end

  def update
    @answer = Answer.find(params[:id])
    # @answer.user_id = current_user.id
    # @answer.question_id = params[:answer][:question_id]
    # @answer.choice_id = params[:answer][:choice_id]

    if @answer.update!(answer_params)
      redirect_to questions_path
       flash[:notice] = "回答を変更しました。"
    else
       flash.now[:alert] = "失敗！"
      render "new"
    end
  end

private
  def answer_params
    params.require(:answer).permit(:comment, :choice_id, :question_id, :user_id)
  end

end
