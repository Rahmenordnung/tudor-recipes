class RemoveCategoriesFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :categories, :string
  end
end

