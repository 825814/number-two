class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :choice
  


  # private
  # def increment_choice_answers_count
  #   choice.increment!(:answers_count)
  # end

  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group('choices.id').order('count(*) DESC')
  # end

def self.ranking(question_id)
    joins(:choice)
      .where(question_id: question_id)
      .group('choices.id')
      .select('choices.*, COUNT(*) AS choice_count')
      .order('choice_count DESC')
end


def bookmarked_by_admin?
  admin_bookmarks.exists?(answer_id: id)
end

# キーワード検索
def self.looks(search, word)
  if search == "perfect_match"
    @answer = Answer.where("name LIKE?", "#{word}")
  elsif search == "forward_match"
    @answer = Answer.where("name LIKE?","#{word}%")
  elsif search == "backward_match"
    @answer = Answer.where("name LIKE?","%#{word}")
  elsif search == "partial_match"
    @answer = Answer.where("name LIKE?","%#{word}%")
  else
    @answer = Answer.all
  end
end

end
