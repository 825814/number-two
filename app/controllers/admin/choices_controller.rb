class Admin::ChoicesController < ApplicationController
  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save!
      flash[:notice] = "成功！"
      redirect_to "/admin/choices"
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  def index
    @choices = Choice.all
  end

  private
    def choice_params
      params.require(:choice).permit(:choice, :question_id)
    end


end
