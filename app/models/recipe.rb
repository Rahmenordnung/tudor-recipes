class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :cooking_time, presence: true
  validates :categories, presence: false #I don ´t consider categories as an essential element in recipies, some chef may know it some not
  belongs_to :chef
  validates :chef_id, presence: true
  #latest recipe is going to be displayed the first one
  default_scope -> { order(updated_at: :desc)} 
  has_many :recipe_ingredients
  has_many :recipe_categories
  has_many :ingredients, through: :recipe_ingredients
  has_many :categories, through: :recipe_categories
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size    
  end
end