require 'test_helper'

class GalleryPostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gallery_post_index_url
    assert_response :success
  end

  test "should get new" do
    get gallery_post_new_url
    assert_response :success
  end

  test "should get edit" do
    get gallery_post_edit_url
    assert_response :success
  end

  test "should get update" do
    get gallery_post_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gallery_post_destroy_url
    assert_response :success
  end

end
