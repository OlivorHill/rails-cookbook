class Recipe < ApplicationRecord
  validates :name, :description, :image_url, :rating, presence: true
  validates :item, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  has_many :bookmarks, :categories
  has_many :categories, through: :bookmarks
end
