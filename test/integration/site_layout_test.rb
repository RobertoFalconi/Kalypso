require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'kalypso/home'
    assert_select "a[href=?]", root_path, count:2 #because we have two link for home (logo and home)
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path, count:2
  end

end