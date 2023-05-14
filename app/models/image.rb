class Image < ApplicationRecord
  has_one_attached :image
  belongs_to :admin


  validates :image, presence: true
end
