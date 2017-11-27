require 'test_helper'

class AssistantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assistant = assistants(:one)
  end

  test "should get index" do
    get assistants_url
    assert_response :success
  end

  test "should get new" do
    get new_assistant_url
    assert_response :success
  end

  test "should create assistant" do
    assert_difference('Assistant.count') do
      post assistants_url, params: { assistant: { assistant_type: @assistant.assistant_type, location_id: @assistant.location_id, name: @assistant.name, paypal_email: @assistant.paypal_email, phone: @assistant.phone, rate: @assistant.rate } }
    end

    assert_redirected_to assistant_url(Assistant.last)
  end

  test "should show assistant" do
    get assistant_url(@assistant)
    assert_response :success
  end

  test "should get edit" do
    get edit_assistant_url(@assistant)
    assert_response :success
  end

  test "should update assistant" do
    patch assistant_url(@assistant), params: { assistant: { assistant_type: @assistant.assistant_type, location_id: @assistant.location_id, name: @assistant.name, paypal_email: @assistant.paypal_email, phone: @assistant.phone, rate: @assistant.rate } }
    assert_redirected_to assistant_url(@assistant)
  end

  test "should destroy assistant" do
    assert_difference('Assistant.count', -1) do
      delete assistant_url(@assistant)
    end

    assert_redirected_to assistants_url
  end
end
