require "test_helper"

class Public::MyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_my_pages_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_my_pages_edit_url
    assert_response :success
  end

  test "should get bye" do
    get public_my_pages_bye_url
    assert_response :success
  end
end
