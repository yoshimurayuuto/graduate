require 'test_helper'

class MoneisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moneis_index_url
    assert_response :success
  end

end
