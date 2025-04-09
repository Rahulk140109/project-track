require "test_helper"

class ProjectEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_events_index_url
    assert_response :success
  end
end
