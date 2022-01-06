require 'test_helper'

class EventJoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_joins_create_url
    assert_response :success
  end

  test "should get index" do
    get event_joins_index_url
    assert_response :success
  end

  test "should get show" do
    get event_joins_show_url
    assert_response :success
  end

end
