require 'test_helper'

class CreativeRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creative_request = creative_requests(:one)
  end

  test "should get index" do
    get creative_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_creative_request_url
    assert_response :success
  end

  test "should create creative_request" do
    assert_difference('CreativeRequest.count') do
      post creative_requests_url, params: { creative_request: { accepted: @creative_request.accepted, accepted_on: @creative_request.accepted_on, approved: @creative_request.approved, company_id: @creative_request.company_id, creative_id: @creative_request.creative_id, deadline: @creative_request.deadline, declined: @creative_request.declined, requested_by_id: @creative_request.requested_by_id, shoot_id: @creative_request.shoot_id } }
    end

    assert_redirected_to creative_request_url(CreativeRequest.last)
  end

  test "should show creative_request" do
    get creative_request_url(@creative_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_creative_request_url(@creative_request)
    assert_response :success
  end

  test "should update creative_request" do
    patch creative_request_url(@creative_request), params: { creative_request: { accepted: @creative_request.accepted, accepted_on: @creative_request.accepted_on, approved: @creative_request.approved, company_id: @creative_request.company_id, creative_id: @creative_request.creative_id, deadline: @creative_request.deadline, declined: @creative_request.declined, requested_by_id: @creative_request.requested_by_id, shoot_id: @creative_request.shoot_id } }
    assert_redirected_to creative_request_url(@creative_request)
  end

  test "should destroy creative_request" do
    assert_difference('CreativeRequest.count', -1) do
      delete creative_request_url(@creative_request)
    end

    assert_redirected_to creative_requests_url
  end
end
