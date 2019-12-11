require 'test_helper'

class PhilosophiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get philosophies_index_url
    assert_response :success
  end

end
