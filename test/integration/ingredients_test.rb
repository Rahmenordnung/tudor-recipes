require 'test_helper'

class IngredientsTest < ActionDispatch::IntegrationTest

  def setup
    
    
    
    @chef = Chef.create!(chefname: "tudor", email: "tudor@example.com", chef_stars: 3,
                          password: "password", password_confirmation: "password")
    @ingredient = Ingredient.create!(name: "water")
    @ingredient2 = Ingredient.create!(name: "meat")
    
  end

  test "should get ingredients index" do
    get ingredients_path
    assert_response :success
  end
  
   test "should get recipes listing" do
    get ingredients_path
    assert_template 'ingredients/index'
    assert_response :success
    # assert_select "p", ingredients_path(@ingredient), text: @ingredient.name
    # assert_select "a[href=?]", ingredients_path(@ingredient), text: @ingredient.name
  end
  
  
  test "create new ingrediente" do
    sign_in_as(@chef, "password")
    get new_ingredient_path
    # assert_template 'ingredients/new'
    ingredient_at_recipe = "water"
    assert_difference 'Ingredient.count', 0 do
      post ingredients_path, params: { ingredient: { name: ingredient_at_recipe}}
    end
    follow_redirect!
    assert_match ingredient_at_recipe.capitalize, response.body
  end
  

  
end  