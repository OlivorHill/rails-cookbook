class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks, dependent: :destroy
  has_one_attached :photo
  # category.photo - will retrieve the photo associated with this category

  validates :name, presence: true, uniqueness: true
end
