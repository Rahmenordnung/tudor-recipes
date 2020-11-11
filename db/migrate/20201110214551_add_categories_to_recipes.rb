class AddCategoriesToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :categories, :string
  end
end
