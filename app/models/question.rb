class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  def answered_by?(user)
    answers.exists?(user_id: user.id)
  end


end

