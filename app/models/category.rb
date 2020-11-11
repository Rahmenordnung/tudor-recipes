class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :title
  validates :description, presence: false, length: { minimum: 3, maximum: 250 }
  validates_uniqueness_of :description
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

end
