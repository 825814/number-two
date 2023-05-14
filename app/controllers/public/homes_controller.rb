class Public::HomesController < ApplicationController
  include ActionView::Helpers::AssetUrlHelper

# 投稿された画像がない場合はno_image.jpgを表示する
# タイトルがない場合@image_title = "Untitled"ビューも@image.titleから@image_titleに変更
  def top
    @image = Image.first
    if @image.blank?
      @image_url = asset_path('no_image.jpg')
    elsif @image.title.blank?
      @image_url = url_for(@image.image)
      @image_title = "Untitled"
    else
      @image_url = url_for(@image.image)
      @image_title = @image.title
    end
  end


end


