require 'test_helper'

class FollowRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get follow_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get follow_relations_destroy_url
    assert_response :success
  end

end
