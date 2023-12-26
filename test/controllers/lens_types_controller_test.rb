require "test_helper"

class LensTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lens_types_index_url
    assert_response :success
  end
end
