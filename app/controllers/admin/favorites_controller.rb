class Admin::FavoritesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @favorites = current_admin.favorites.includes(:answer)
  end

  def create
    favorite = current_admin.favorites.build(answer_id: params[:answer_id])
    if favorite.save
      redirect_back fallback_location: root_path, notice: "コメントをお気に入り登録"
    else
      flash[:alert] = "コメントのお気に入り登録に失敗しました"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    favorite = current_admin.favorites.find_by(id: params[:id])
    if favorite
      favorite.destroy
      redirect_back fallback_location: root_path, notice: "お気に入りを解除しました。"
      # redirect_to admin_admin_path, notice: "お気に入りを解除しました。"
    else
      redirect_to admin_admin_path, alert: "お気に入りが見つかりませんでした。"
    end
  end

  # def favorite_comments
  #   @favorite_comments = current_admin.favorites.map{ |f| f.answer.comment }
  # end

end
