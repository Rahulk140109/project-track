require "test_helper"

class CommentEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_events_create_url
    assert_response :success
  end
end
