require 'test_helper'

class PackageTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_type = package_types(:one)
  end

  test "should get index" do
    get package_types_url
    assert_response :success
  end

  test "should get new" do
    get new_package_type_url
    assert_response :success
  end

  test "should create package_type" do
    assert_difference('PackageType.count') do
      post package_types_url, params: { package_type: {  } }
    end

    assert_redirected_to package_type_url(PackageType.last)
  end

  test "should show package_type" do
    get package_type_url(@package_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_type_url(@package_type)
    assert_response :success
  end

  test "should update package_type" do
    patch package_type_url(@package_type), params: { package_type: {  } }
    assert_redirected_to package_type_url(@package_type)
  end

  test "should destroy package_type" do
    assert_difference('PackageType.count', -1) do
      delete package_type_url(@package_type)
    end

    assert_redirected_to package_types_url
  end
end
