class Admin::ImagesController < ApplicationController
  def new
    @image = Image.new
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
      redirect_to '/admin/admin', notice: '画像を投稿しました'
    else
      render :new
    end
  end

  # def update
  #   image = Image.find(1)
  #   if image.update(image_params)
  #     redirect_to '/admin/admin', notice: '変更しました。'
  #   else
  #     render :edit
  #   end
  # end

  # def edit
  #   @image = Image.find(1)
  # end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
