require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest

  def setup

    @chef = Chef.create!(chefname: "tudor", email: "tudor@example.com", chef_stars: 3,
                          password: "password", password_confirmation: "password")
    @category = Category.create!(title: "desserts", description:"sweet")
    
    
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end
  
   test "should get categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_response :success

  end
  
  

  

  
end  