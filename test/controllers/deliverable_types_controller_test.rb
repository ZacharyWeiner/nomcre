require 'test_helper'

class DeliverableTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deliverable_type = deliverable_types(:one)
  end

  test "should get index" do
    get deliverable_types_url
    assert_response :success
  end

  test "should get new" do
    get new_deliverable_type_url
    assert_response :success
  end

  test "should create deliverable_type" do
    assert_difference('DeliverableType.count') do
      post deliverable_types_url, params: { deliverable_type: { name: @deliverable_type.name, specification: @deliverable_type.specification } }
    end

    assert_redirected_to deliverable_type_url(DeliverableType.last)
  end

  test "should show deliverable_type" do
    get deliverable_type_url(@deliverable_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_deliverable_type_url(@deliverable_type)
    assert_response :success
  end

  test "should update deliverable_type" do
    patch deliverable_type_url(@deliverable_type), params: { deliverable_type: { name: @deliverable_type.name, specification: @deliverable_type.specification } }
    assert_redirected_to deliverable_type_url(@deliverable_type)
  end

  test "should destroy deliverable_type" do
    assert_difference('DeliverableType.count', -1) do
      delete deliverable_type_url(@deliverable_type)
    end

    assert_redirected_to deliverable_types_url
  end
end
