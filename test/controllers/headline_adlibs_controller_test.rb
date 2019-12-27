require 'test_helper'

class HeadlineAdlibsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @headline_adlib = headline_adlibs(:one)
  end

  test "should get index" do
    get headline_adlibs_url
    assert_response :success
  end

  test "should get new" do
    get new_headline_adlib_url
    assert_response :success
  end

  test "should create headline_adlib" do
    assert_difference('HeadlineAdlib.count') do
      post headline_adlibs_url, params: { headline_adlib: { stage: @headline_adlib.stage, title: @headline_adlib.title } }
    end

    assert_redirected_to headline_adlib_url(HeadlineAdlib.last)
  end

  test "should show headline_adlib" do
    get headline_adlib_url(@headline_adlib)
    assert_response :success
  end

  test "should get edit" do
    get edit_headline_adlib_url(@headline_adlib)
    assert_response :success
  end

  test "should update headline_adlib" do
    patch headline_adlib_url(@headline_adlib), params: { headline_adlib: { stage: @headline_adlib.stage, title: @headline_adlib.title } }
    assert_redirected_to headline_adlib_url(@headline_adlib)
  end

  test "should destroy headline_adlib" do
    assert_difference('HeadlineAdlib.count', -1) do
      delete headline_adlib_url(@headline_adlib)
    end

    assert_redirected_to headline_adlibs_url
  end
end
