require "test_helper"

class StatusChangeEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get status_change_events_create_url
    assert_response :success
  end
end
