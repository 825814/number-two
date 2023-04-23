class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  # ？
  # has_many :choices, dependent: :destroy
  def answered_by?(user)
    answers.exists?(user_id: user.id)
  end


end

