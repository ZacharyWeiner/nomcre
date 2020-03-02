require 'test_helper'

class CongratulationsVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @congratulations_video = congratulations_videos(:one)
  end

  test "should get index" do
    get congratulations_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_congratulations_video_url
    assert_response :success
  end

  test "should create congratulations_video" do
    assert_difference('CongratulationsVideo.count') do
      post congratulations_videos_url, params: { congratulations_video: { cover: @congratulations_video.cover, file: @congratulations_video.file, name: @congratulations_video.name, slug: @congratulations_video.slug } }
    end

    assert_redirected_to congratulations_video_url(CongratulationsVideo.last)
  end

  test "should show congratulations_video" do
    get congratulations_video_url(@congratulations_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_congratulations_video_url(@congratulations_video)
    assert_response :success
  end

  test "should update congratulations_video" do
    patch congratulations_video_url(@congratulations_video), params: { congratulations_video: { cover: @congratulations_video.cover, file: @congratulations_video.file, name: @congratulations_video.name, slug: @congratulations_video.slug } }
    assert_redirected_to congratulations_video_url(@congratulations_video)
  end

  test "should destroy congratulations_video" do
    assert_difference('CongratulationsVideo.count', -1) do
      delete congratulations_video_url(@congratulations_video)
    end

    assert_redirected_to congratulations_videos_url
  end
end
