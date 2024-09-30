class Recipe < ApplicationRecord
  validates :name, :description, :image_url, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  has_many :bookmarks
end
