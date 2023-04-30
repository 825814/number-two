class Favorite < ApplicationRecord
  belongs_to :answer
  belongs_to :admin
end
