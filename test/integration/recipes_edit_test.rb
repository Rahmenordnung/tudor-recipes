require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "tudor", email: "tudor@example.com", chef_stars: "3",
                          password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", cooking_time: 60, chef: @chef)
  end

  test "reject invalid recipe update" do
    sign_in_as(@chef, "password")
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: { name: " ", description: "some description", cooking_time: 60 } } 
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "successfully edit a recipe" do
    sign_in_as(@chef, "password")
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    updated_name = "updated recipe name"
    updated_description = "updated recipe description"
    updated_cooking_time_of_recipe = 65
    patch recipe_path(@recipe), params: { recipe: { name: updated_name, description: updated_description, cooking_time: updated_cooking_time_of_recipe } }
    assert_redirected_to @recipe
    #follow_redirect!
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @recipe.name
    assert_match updated_description, @recipe.description
  end
end


