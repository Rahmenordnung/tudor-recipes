require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "tudor", email: "tudor@example.com", chef_stars: 3,
                          password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "john", email: "john@example.com",chef_stars: 3,
                        password: "password", password_confirmation: "password")
    @admin_user = Chef.create!(chefname: "john1", email: "john1@example.com", chef_stars: 3,
                        password: "password", password_confirmation: "password", admin: true)                    
  end

  test "reject an invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chefname: " ", email: "tudor@example.com", chef_stars: " " } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chefname: "tudor1", email: "tudor1@example.com",  chef_stars: "3"} }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "tudor1", @chef.chefname
    assert_match "tudor1@example.com", @chef.email
    # assert_match "3", @chef.chef_stars
  end
  
  test "accept edit attempt by admin user" do
    sign_in_as(@admin_user, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chefname: "tudor3", email: "tudor3@example.com",  chef_stars: "3" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "tudor3", @chef.chefname
    assert_match "tudor3@example.com", @chef.email
  end

  test "redirect edit attempt by another non-admin user" do
    sign_in_as(@chef2, "password")
    updated_name = "joe"
    updated_email = "joe@example.com"
    updated_chefs_stars = 4
    patch chef_path(@chef), params: { chef: { chefname: updated_name, email: updated_email, chef_stars: updated_chefs_stars } }
    assert_redirected_to chefs_path
    assert_not flash.empty?
    @chef.reload
    assert_match "tudor", @chef.chefname
    assert_match "tudor@example.com", @chef.email
  end  
end
