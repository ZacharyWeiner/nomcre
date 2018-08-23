require 'test_helper'

class ShotListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shot_list_item = shot_list_items(:one)
  end

  test "should get index" do
    get shot_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_shot_list_item_url
    assert_response :success
  end

  test "should create shot_list_item" do
    assert_difference('ShotListItem.count') do
      post shot_list_items_url, params: { shot_list_item: { background: @shot_list_item.background, description: @shot_list_item.description, item_type: @shot_list_item.item_type, proposal_id: @shot_list_item.proposal_id, task_id: @shot_list_item.task_id, upload: @shot_list_item.upload } }
    end

    assert_redirected_to shot_list_item_url(ShotListItem.last)
  end

  test "should show shot_list_item" do
    get shot_list_item_url(@shot_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_shot_list_item_url(@shot_list_item)
    assert_response :success
  end

  test "should update shot_list_item" do
    patch shot_list_item_url(@shot_list_item), params: { shot_list_item: { background: @shot_list_item.background, description: @shot_list_item.description, item_type: @shot_list_item.item_type, proposal_id: @shot_list_item.proposal_id, task_id: @shot_list_item.task_id, upload: @shot_list_item.upload } }
    assert_redirected_to shot_list_item_url(@shot_list_item)
  end

  test "should destroy shot_list_item" do
    assert_difference('ShotListItem.count', -1) do
      delete shot_list_item_url(@shot_list_item)
    end

    assert_redirected_to shot_list_items_url
  end
end
