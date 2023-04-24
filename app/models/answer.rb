class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :choice


  # , counter_cache: true
  # after_create :increment_choice_answers_count

  # private

  # def increment_choice_answers_count
  #   choice.increment!(:answers_count)
  # end

  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group(:choice_id).order('count(*) DESC')
  # end
  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group(:choice_id).order('COUNT(*) DESC')
  # end
  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group(:choice_id).order('COUNT(*) desc')
  # end
  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group(:choice_id).order('count(*) DESC')
  # end
  # def self.ranking(question_id)
  #   joins(:choice).where(question_id: question_id).group(:choice_id).order('count(*) DESC')
  # end
  def self.ranking(question_id)
    joins(:choice).where(question_id: question_id).group(:choice_id).order('count(*) DESC')
  end


end
