require "test_helper"

class AssignmentDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignment_details_index_url
    assert_response :success
  end
end
