require 'test_helper'

class KitchenControllerTest < ActionController::TestCase
  test "should get prepare" do
    get :prepare
    assert_response :success
  end

end
