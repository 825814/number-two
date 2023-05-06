class Admin::HomesController < ApplicationController
  def top
    @questions = Question.all
  end
  
 
  
end
