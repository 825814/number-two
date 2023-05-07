class Public::HomesController < ApplicationController

  def top
    @image = Image.first
    if @image.blank?
      @image = Image.new
      @image.image = File.open("#{Rails.root}/app/assets/images/no_image.jpg")
      @image.save
      # これで、画像がない場合でもno_image.jpgが表示されるか？
    end
  end

end


