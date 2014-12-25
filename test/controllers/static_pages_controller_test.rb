require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App';
  end

  test "should get home" do
    get :home # page should be accessed via get
    assert_select 'title', "Home | #{@base_title}"
    assert_response :success # synonym for status code 200
  end

  test "should get help" do
    get :help
    assert_select 'title', "Help | #{@base_title}"
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_select 'title', "About | #{@base_title}"
    assert_response :success
    end

  test "should get contact" do
    get :contact
    assert_select 'title', "Contact | #{@base_title}"
    assert_response :success
  end

end
