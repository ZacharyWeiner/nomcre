require 'test_helper'

class ShotListItemTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shot_list_item_template = shot_list_item_templates(:one)
  end

  test "should get index" do
    get shot_list_item_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_shot_list_item_template_url
    assert_response :success
  end

  test "should create shot_list_item_template" do
    assert_difference('ShotListItemTemplate.count') do
      post shot_list_item_templates_url, params: { shot_list_item_template: { aspect_ratio: @shot_list_item_template.aspect_ratio, background: @shot_list_item_template.background, description: @shot_list_item_template.description, focus_point: @shot_list_item_template.focus_point, frame_rate: @shot_list_item_template.frame_rate, item_type: @shot_list_item_template.item_type, reference_image: @shot_list_item_template.reference_image, task_group_id: @shot_list_item_template.task_group_id } }
    end

    assert_redirected_to shot_list_item_template_url(ShotListItemTemplate.last)
  end

  test "should show shot_list_item_template" do
    get shot_list_item_template_url(@shot_list_item_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_shot_list_item_template_url(@shot_list_item_template)
    assert_response :success
  end

  test "should update shot_list_item_template" do
    patch shot_list_item_template_url(@shot_list_item_template), params: { shot_list_item_template: { aspect_ratio: @shot_list_item_template.aspect_ratio, background: @shot_list_item_template.background, description: @shot_list_item_template.description, focus_point: @shot_list_item_template.focus_point, frame_rate: @shot_list_item_template.frame_rate, item_type: @shot_list_item_template.item_type, reference_image: @shot_list_item_template.reference_image, task_group_id: @shot_list_item_template.task_group_id } }
    assert_redirected_to shot_list_item_template_url(@shot_list_item_template)
  end

  test "should destroy shot_list_item_template" do
    assert_difference('ShotListItemTemplate.count', -1) do
      delete shot_list_item_template_url(@shot_list_item_template)
    end

    assert_redirected_to shot_list_item_templates_url
  end
end
