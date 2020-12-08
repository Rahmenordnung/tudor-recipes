require 'test_helper'

class ContactMeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_me_index_url
    assert_response :success
  end

end
