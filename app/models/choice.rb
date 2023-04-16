class Choice < ApplicationRecord
  has_many :answers, dependent: :destroy
end
