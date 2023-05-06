class Public::HomesController < ApplicationController
  def top
    @image = Image.first
  end
end
