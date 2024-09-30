class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks, dependent: :destroy
end
