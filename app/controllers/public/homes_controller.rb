class Public::HomesController < ApplicationController
  include ActionView::Helpers::AssetUrlHelper

  def top
    @image = Image.first
    if @image.blank?
      @image_url = asset_path('no_image.jpg')
    else
      @image_url = url_for(@image.image)
    end
  end
# 投稿された画像がない場合はno_image.jpgを表示する

end


