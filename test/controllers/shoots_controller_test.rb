require 'test_helper'

class ShootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoot = shoots(:one)
  end

  test "should get index" do
    get shoots_url
    assert_response :success
  end

  test "should get new" do
    get new_shoot_url
    assert_response :success
  end

  test "should create shoot" do
    assert_difference('Shoot.count') do
      post shoots_url, params: { shoot: { background: @shoot.background, background_note: @shoot.background_note, brief: @shoot.brief, bts: @shoot.bts, company_id: @shoot.company_id, content_type: @shoot.content_type, creative_id: @shoot.creative_id, focus_points: @shoot.focus_points, location_id: @shoot.location_id, price: @shoot.price, project_id: @shoot.project_id, shoot_raw: @shoot.shoot_raw, shoot_style: @shoot.shoot_style, time_of_day: @shoot.time_of_day, user_added_shot_count: @shoot.user_added_shot_count, user_added_shot_count_max: @shoot.user_added_shot_count_max } }
    end

    assert_redirected_to shoot_url(Shoot.last)
  end

  test "should show shoot" do
    get shoot_url(@shoot)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoot_url(@shoot)
    assert_response :success
  end

  test "should update shoot" do
    patch shoot_url(@shoot), params: { shoot: { background: @shoot.background, background_note: @shoot.background_note, brief: @shoot.brief, bts: @shoot.bts, company_id: @shoot.company_id, content_type: @shoot.content_type, creative_id: @shoot.creative_id, focus_points: @shoot.focus_points, location_id: @shoot.location_id, price: @shoot.price, project_id: @shoot.project_id, shoot_raw: @shoot.shoot_raw, shoot_style: @shoot.shoot_style, time_of_day: @shoot.time_of_day, user_added_shot_count: @shoot.user_added_shot_count, user_added_shot_count_max: @shoot.user_added_shot_count_max } }
    assert_redirected_to shoot_url(@shoot)
  end

  test "should destroy shoot" do
    assert_difference('Shoot.count', -1) do
      delete shoot_url(@shoot)
    end

    assert_redirected_to shoots_url
  end
end
