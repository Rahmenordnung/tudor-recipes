require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "tudor", email: "tudor@example.com", chef_stars: 1)
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe", cooking_time: 60)  
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  

  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
    test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "cooking_time should be present" do
    @recipe.cooking_time = " "
    assert_not @recipe.valid?
  end
  

  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end


end 