require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home # page should be accessed via get
    assert_select 'title', 'Home | Ruby on Rails Tutorial Sample App'
    assert_response :success # synonym for status code 200
  end

  test "should get help" do
    get :help
    assert_select 'title', 'Help | Ruby on Rails Tutorial Sample App'
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_select 'title', 'About | Ruby on Rails Tutorial Sample App'
    assert_response :success
  end

end
