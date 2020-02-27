require 'test_helper'

class HappyBirthdayVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @happy_birthday_video = happy_birthday_videos(:one)
  end

  test "should get index" do
    get happy_birthday_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_happy_birthday_video_url
    assert_response :success
  end

  test "should create happy_birthday_video" do
    assert_difference('HappyBirthdayVideo.count') do
      post happy_birthday_videos_url, params: { happy_birthday_video: { file: @happy_birthday_video.file, name: @happy_birthday_video.name } }
    end

    assert_redirected_to happy_birthday_video_url(HappyBirthdayVideo.last)
  end

  test "should show happy_birthday_video" do
    get happy_birthday_video_url(@happy_birthday_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_happy_birthday_video_url(@happy_birthday_video)
    assert_response :success
  end

  test "should update happy_birthday_video" do
    patch happy_birthday_video_url(@happy_birthday_video), params: { happy_birthday_video: { file: @happy_birthday_video.file, name: @happy_birthday_video.name } }
    assert_redirected_to happy_birthday_video_url(@happy_birthday_video)
  end

  test "should destroy happy_birthday_video" do
    assert_difference('HappyBirthdayVideo.count', -1) do
      delete happy_birthday_video_url(@happy_birthday_video)
    end

    assert_redirected_to happy_birthday_videos_url
  end
end
