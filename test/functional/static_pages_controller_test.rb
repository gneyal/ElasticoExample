require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get readme" do
    get :readme
    assert_response :success
  end

end
