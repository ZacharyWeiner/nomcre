require 'test_helper'

class DiscountCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount_code = discount_codes(:one)
  end

  test "should get index" do
    get discount_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_code_url
    assert_response :success
  end

  test "should create discount_code" do
    assert_difference('DiscountCode.count') do
      post discount_codes_url, params: { discount_code: { code: @discount_code.code, discount_type: @discount_code.discount_type, expiration_date: @discount_code.expiration_date, max_uses: @discount_code.max_uses } }
    end

    assert_redirected_to discount_code_url(DiscountCode.last)
  end

  test "should show discount_code" do
    get discount_code_url(@discount_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_code_url(@discount_code)
    assert_response :success
  end

  test "should update discount_code" do
    patch discount_code_url(@discount_code), params: { discount_code: { code: @discount_code.code, discount_type: @discount_code.discount_type, expiration_date: @discount_code.expiration_date, max_uses: @discount_code.max_uses } }
    assert_redirected_to discount_code_url(@discount_code)
  end

  test "should destroy discount_code" do
    assert_difference('DiscountCode.count', -1) do
      delete discount_code_url(@discount_code)
    end

    assert_redirected_to discount_codes_url
  end
end
