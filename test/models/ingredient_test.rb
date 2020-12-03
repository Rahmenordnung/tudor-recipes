require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
    def setup
        @ingredient = Ingredient.create!(name: "water")
    end
    

  test "ingredient should be valid" do
    assert @ingredient.valid?
  end
  
  test "name should be present" do
    @ingredient.name = " "
    assert_not @ingredient.valid?
  end
    
    
    
end