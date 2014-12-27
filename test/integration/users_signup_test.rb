require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get new_user_path
    # get signup_path same
    before_count = User.count
    post users_path, user: { name: "",
                            email: "user@invalid",
                            password: "foo",
                            password_confirmation: "bar" }

    after_count = User.count
    assert_equal before_count, after_count
    assert_template 'users/new'
  end

  test "invalid signup information 222" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div.error_explanation'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example user",
                                             email: "user@example.com",
                                             password:              "password",
                                             password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_not flash.nil?
  end

end
