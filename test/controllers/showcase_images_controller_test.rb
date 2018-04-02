require 'test_helper'

class ShowcaseImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showcase_image = showcase_images(:one)
  end

  test "should get index" do
    get showcase_images_url
    assert_response :success
  end

  test "should get new" do
    get new_showcase_image_url
    assert_response :success
  end

  test "should create showcase_image" do
    assert_difference('ShowcaseImage.count') do
      post showcase_images_url, params: { showcase_image: { file: @showcase_image.file, name: @showcase_image.name, order: @showcase_image.order, show: @showcase_image.show, showcase_type: @showcase_image.showcase_type } }
    end

    assert_redirected_to showcase_image_url(ShowcaseImage.last)
  end

  test "should show showcase_image" do
    get showcase_image_url(@showcase_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_showcase_image_url(@showcase_image)
    assert_response :success
  end

  test "should update showcase_image" do
    patch showcase_image_url(@showcase_image), params: { showcase_image: { file: @showcase_image.file, name: @showcase_image.name, order: @showcase_image.order, show: @showcase_image.show, showcase_type: @showcase_image.showcase_type } }
    assert_redirected_to showcase_image_url(@showcase_image)
  end

  test "should destroy showcase_image" do
    assert_difference('ShowcaseImage.count', -1) do
      delete showcase_image_url(@showcase_image)
    end

    assert_redirected_to showcase_images_url
  end
end
