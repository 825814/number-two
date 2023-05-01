class Choice < ApplicationRecord
  has_many :answers, dependent: :destroy

  # ?
  # belongs_to :question

# キーワード検索
  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @choice = Choice.where("name LIKE?", "#{word}")
  #   elsif search == "forward_match"
  #     @choice = Choice.where("name LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @choice = Choice.where("name LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @choice = Choice.where("name LIKE?","%#{word}%")
  #   else
  #     @choice = Choice.all
  #   end
  # end
end
