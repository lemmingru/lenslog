require "test_helper"

class LensesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lenses_new_url
    assert_response :success
  end

  test "should get create" do
    get lenses_create_url
    assert_response :success
  end

  test "should get use" do
    get lenses_use_url
    assert_response :success
  end
end
