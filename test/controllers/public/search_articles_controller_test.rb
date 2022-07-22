require "test_helper"

class Public::SearchArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_search_articles_index_url
    assert_response :success
  end
end
