require 'test_helper'

class LikeRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get like_relations_show_url
    assert_response :success
  end

  test "should get create" do
    get like_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get like_relations_destroy_url
    assert_response :success
  end

end
