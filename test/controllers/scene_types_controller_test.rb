require 'test_helper'

class SceneTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scene_type = scene_types(:one)
  end

  test "should get index" do
    get scene_types_url
    assert_response :success
  end

  test "should get new" do
    get new_scene_type_url
    assert_response :success
  end

  test "should create scene_type" do
    assert_difference('SceneType.count') do
      post scene_types_url, params: { scene_type: { name: @scene_type.name } }
    end

    assert_redirected_to scene_type_url(SceneType.last)
  end

  test "should show scene_type" do
    get scene_type_url(@scene_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_scene_type_url(@scene_type)
    assert_response :success
  end

  test "should update scene_type" do
    patch scene_type_url(@scene_type), params: { scene_type: { name: @scene_type.name } }
    assert_redirected_to scene_type_url(@scene_type)
  end

  test "should destroy scene_type" do
    assert_difference('SceneType.count', -1) do
      delete scene_type_url(@scene_type)
    end

    assert_redirected_to scene_types_url
  end
end
