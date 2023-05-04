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
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    # if params[:answer][:choice].blank?
    #   flash.now[:alert] = "選択肢を選択してください。"
    #   render :new and return
    # end

    if @answer.save
      redirect_to questions_path, notice: '回答を投稿しました。'
    else
      render :new
    end
  end
# 　選択肢が選択されていなかったり、理由が入力されていなかった場合にエラーメッセージが表示される

  # def create
  #   @question = Question.find(params[:question_id])
  #   @answer = @question.answers.new(answer_params)

        # @answer = current_user.answers.new(answer_params)
        #さっきまでこれだった @answer = Answer.new(answer_params)

  #   @answer.user_id = current_user.id

  #   @answer.question_id = params[:answer][:question_id]
  #   @answer.choice_id = params[:answer][:choice_id]

  #   if @answer.save!
  #     flash[:notice] = "回答を投稿しました"
  #     redirect_to questions_path
  #   else
  #     flash.now[:alert] = @answer.errors.full_messages.join(', ')
  #     render "new"
  #   end
  # end


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
    # @answer = @question.current_user.answers
    @answer = current_user.answers.find_by(question_id: params[:question_id])

    # @answer.user_id = current_user.id
    # @answer.question_id = params[:answer][:question_id]
    # @answer.choice_id = params[:answer][:choice_id]

    if @answer.update!(answer_params)
      redirect_to users_my_page_path
       flash[:notice] = "回答を変更しました。"
    else
       flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    # @answer = Answers.find(params[:id])
    @answer = current_user.answers.find_by(question_id: params[:question_id])
  end

private
  def answer_params
    params.require(:answer).permit(:comment, :choice_id, :question_id, :user_id)
  end

end
