require 'test_helper'

class IndiceControllerTest < ActionController::TestCase
  test "should get indice" do
    get :indice
    assert_response :success
  end

end
