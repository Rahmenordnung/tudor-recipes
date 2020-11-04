class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :cooking_time, presence: true
  belongs_to :chef
  validates :chef_id, presence: true
end