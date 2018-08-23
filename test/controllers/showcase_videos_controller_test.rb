require 'test_helper'

class ShowcaseVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showcase_video = showcase_videos(:one)
  end

  test "should get index" do
    get showcase_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_showcase_video_url
    assert_response :success
  end

  test "should create showcase_video" do
    assert_difference('ShowcaseVideo.count') do
      post showcase_videos_url, params: { showcase_video: { description: @showcase_video.description, file: @showcase_video.file, order: @showcase_video.order, show: @showcase_video.show, showcase_type: @showcase_video.showcase_type, thumbnail: @showcase_video.thumbnail, title: @showcase_video.title } }
    end

    assert_redirected_to showcase_video_url(ShowcaseVideo.last)
  end

  test "should show showcase_video" do
    get showcase_video_url(@showcase_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_showcase_video_url(@showcase_video)
    assert_response :success
  end

  test "should update showcase_video" do
    patch showcase_video_url(@showcase_video), params: { showcase_video: { description: @showcase_video.description, file: @showcase_video.file, order: @showcase_video.order, show: @showcase_video.show, showcase_type: @showcase_video.showcase_type, thumbnail: @showcase_video.thumbnail, title: @showcase_video.title } }
    assert_redirected_to showcase_video_url(@showcase_video)
  end

  test "should destroy showcase_video" do
    assert_difference('ShowcaseVideo.count', -1) do
      delete showcase_video_url(@showcase_video)
    end

    assert_redirected_to showcase_videos_url
  end
end
