# class Article < ApplicationRecord
#   scope :search, ->(query) { where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%") }
# end
