require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get browse" do
    get game_browse_url
    assert_response :success
  end

end
