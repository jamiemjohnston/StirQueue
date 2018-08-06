require 'test_helper'

class PostreqsControllerTest < ActionDispatch::IntegrationTest
  test "should get requests" do
    get postreqs_requests_url
    assert_response :success
  end

end
