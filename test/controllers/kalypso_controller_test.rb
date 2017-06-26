require 'test_helper'

#class KalypsoControllerTest < ActionDispatch::IntegrationTest
class KalypsoControllerTest < ActionController::TestCase

  test "should get home" do
    get :home #kalypso_home_url
    assert_response :success
    assert_select "title", "Home | Kalypso"

  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Kalypso"

  end

  test "should get faq" do
    get :faq
    assert_response :success
    assert_select "title", "F.A.Q. | Kalypso"

  end

end
