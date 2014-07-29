require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get public" do
    get :public
    assert_response :success
  end

  test "should get private" do
    get :private
    assert_response :success
  end

end
