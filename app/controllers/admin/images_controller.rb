class Admin::ImagesController < ApplicationController
  def new
    @image = Image.new
    # @image_find = Image.first
  end

  # def create
  #   image = Image.new(image_params)
  #   if image.save!
  #     redirect_to '/admin/admin', notice: '投稿しました。'
  #     # あとでイメージを表示するページを作って遷移するように変更する
  #   else
  #     render :new
  #   end
  # end

  def create
    @image = current_admin.images.first
    if @image.present?
      @image.destroy
    end
    @image = current_admin.images.build(image_params)
    if @image.save
      redirect_to new_admin_image_path, notice: '投稿しました'
    else
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
