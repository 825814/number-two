class Admin::ImagesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @image = Image.new
    @image_find = Image.first
  end

  def create
    @image = current_admin.images.first
    if @image.present?
      @image.destroy
    end
    @image = current_admin.images.build(image_params)
    if @image.save
      redirect_to new_admin_image_path, notice: '投稿しました'
    else
      flash.now[:alert] = 'イメージ画像を設定してください。'
      render :new
    end
  end
  # 投稿して保存されるのが一つになるように、削除している。

  private
  def image_params
    params.require(:image).permit(:image, :title)
  end
end
