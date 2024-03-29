require "test_helper"

class UsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usages_new_url
    assert_response :success
  end

  test "should get create" do
    get usages_create_url
    assert_response :success
  end

  test "should get edit" do
    get usages_edit_url
    assert_response :success
  end

  test "should get delete" do
    get usages_delete_url
    assert_response :success
  end
end
