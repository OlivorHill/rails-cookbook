class Recipe < ApplicationRecord
  has_many :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
