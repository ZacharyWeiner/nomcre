require 'test_helper'

class EmailDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_detail = email_details(:one)
  end

  test "should get index" do
    get email_details_url
    assert_response :success
  end

  test "should get new" do
    get new_email_detail_url
    assert_response :success
  end

  test "should create email_detail" do
    assert_difference('EmailDetail.count') do
      post email_details_url, params: { email_detail: { content: @email_detail.content, detail_type: @email_detail.detail_type, email_id: @email_detail.email_id, order: @email_detail.order } }
    end

    assert_redirected_to email_detail_url(EmailDetail.last)
  end

  test "should show email_detail" do
    get email_detail_url(@email_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_detail_url(@email_detail)
    assert_response :success
  end

  test "should update email_detail" do
    patch email_detail_url(@email_detail), params: { email_detail: { content: @email_detail.content, detail_type: @email_detail.detail_type, email_id: @email_detail.email_id, order: @email_detail.order } }
    assert_redirected_to email_detail_url(@email_detail)
  end

  test "should destroy email_detail" do
    assert_difference('EmailDetail.count', -1) do
      delete email_detail_url(@email_detail)
    end

    assert_redirected_to email_details_url
  end
end
