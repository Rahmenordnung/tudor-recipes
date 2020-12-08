require 'test_helper'

class KontaktControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kontakt_index_url
    assert_response :success
  end

end
