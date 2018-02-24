require 'test_helper'

class PlaylistControllerTest < ActionController::TestCase
  test "should get addSong" do
    get :addSong
    assert_response :success
  end

end
