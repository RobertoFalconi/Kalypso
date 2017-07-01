require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscribers_path
    assert_response :success
  end

end
