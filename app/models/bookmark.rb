class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :comment, length: { minimum: 6, allow_blank: false }
  validates :recipe_id, uniqueness: { scope: :category_id }

  has_many :bookmarks
end
