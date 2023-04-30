class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  # ？
  # has_many :choices, dependent: :destroy
  def answered_by?(user)
    answers.exists?(user_id: user.id)
  end

# キーワード検索
  def self.looks(search, word)
    if search == "perfect_match"
      @question = Question.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @question = Question.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @question = Question.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @question = Question.where("name LIKE?","%#{word}%")
    else
      @question = Question.all
    end
  end
  
  # def index
  #   @question = Question.where('question LIKE ?', "%#{params[:keyword]}%")
  # end



end

