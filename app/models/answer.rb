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

end
