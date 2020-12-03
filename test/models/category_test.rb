require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.create!(title: "desserts", description:" veery sweet ")
    end
    
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "category should be present" do
    @category.title = " "
    assert_not @category.valid?
  end
end
