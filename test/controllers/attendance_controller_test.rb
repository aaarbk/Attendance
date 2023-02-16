require "test_helper"

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get attendance_welcome_url
    assert_response :success
  end
end
