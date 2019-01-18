require 'test_helper'
include AuthHelper
class CollectionsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  setup do

  end

  test "should get index" do
    @user = User.create!(name: 'Bob', email: 'bob@bob.com', password: 'password', password_confirmation:'password')
    @collection = Collection.create!(title: 'Test 1', user_id: @user.id, description: 'This will describe a collection')

    get collections_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_url
    assert_response :success
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post collections_url, params: { collection: { title: @collection.title, user_id: @collection.user_id } }
    end

    assert_redirected_to collection_url(Collection.last)
  end

  test "should show collection" do
    get collection_url(@collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_url(@collection)
    assert_response :success
  end

  test "should update collection" do
    patch collection_url(@collection), params: { collection: { title: @collection.title, user_id: @collection.user_id } }
    assert_redirected_to collection_url(@collection)
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete collection_url(@collection)
    end

    assert_redirected_to collections_url
  end
end
