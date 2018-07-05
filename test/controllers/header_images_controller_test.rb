require 'test_helper'

class HeaderImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @header_image = header_images(:one)
  end

  test "should get index" do
    get header_images_url
    assert_response :success
  end

  test "should get new" do
    get new_header_image_url
    assert_response :success
  end

  test "should create header_image" do
    assert_difference('HeaderImage.count') do
      post header_images_url, params: { header_image: { creators: @header_image.creators, file: @header_image.file, homepage: @header_image.homepage, showcase: @header_image.showcase, title: @header_image.title } }
    end

    assert_redirected_to header_image_url(HeaderImage.last)
  end

  test "should show header_image" do
    get header_image_url(@header_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_header_image_url(@header_image)
    assert_response :success
  end

  test "should update header_image" do
    patch header_image_url(@header_image), params: { header_image: { creators: @header_image.creators, file: @header_image.file, homepage: @header_image.homepage, showcase: @header_image.showcase, title: @header_image.title } }
    assert_redirected_to header_image_url(@header_image)
  end

  test "should destroy header_image" do
    assert_difference('HeaderImage.count', -1) do
      delete header_image_url(@header_image)
    end

    assert_redirected_to header_images_url
  end
end
