require 'test_helper'

class CollectionItemTest < ActiveSupport::TestCase
   setup do
    @user = User.create!(name: 'Testy Mc Tester', email: 'Testy@mctester.com', password: 'password', password_confirmation: 'password')
    @collection = Collection.create!(title: 'Testy Collection', user: @user, description: 'A testable description')
  end

  test "Create A Collection Item Without a User" do
    @collection_item = CollectionItem.new
    @collection_item.user = nil
    @collection_item.collection = @collection
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = ContentType.photo
    @collection_item.is_header = false

    assert_not @collection_item.save, "Saved the collection without a title"

    @collection.destroy!
    @user.destroy!
  end

  test "Create A Collection Item Without a Collection" do
    @collection_item = CollectionItem.new
    @collection_item.user = @user
    @collection_item.collection = nil
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = ContentType.photo
    @collection_item.is_header = false

    assert_not @collection_item.save, "Saved the collection without a title"

    @collection.destroy!
    @user.destroy!
  end

  test "Create A Collection Item Without a Item Type" do
    @collection_item = CollectionItem.new
    @collection_item.user = @user
    @collection_item.collection = @collection
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = nil
    @collection_item.is_header = false

    assert_not @collection_item.save, "Saved the collection without a title"

    @collection.destroy!
    @user.destroy!
  end

  test "Create A Collection Item Without IsHeader" do
    @collection_item = CollectionItem.new
    @collection_item.user = @user
    @collection_item.collection = @collection
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = ContentType.photo
    @collection_item.is_header = nil

    assert_not @collection_item.save, "Saved the collection without a title"

    @collection.destroy!
    @user.destroy!
  end

  test "Create A Collection Item With all fields" do
    @collection_item = CollectionItem.new
    @collection_item.user = @user
    @collection_item.collection = @collection
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = ContentType.photo
    @collection_item.is_header = false

    assert @collection_item.save, "Saved the collection without a title"

    @collection.destroy!
    @user.destroy!
  end

  test "Collection Item - belongs collection " do
    @collection_item = CollectionItem.new
    @collection_item.user = @user
    @collection_item.collection = @collection
    @collection_item.file = "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    @collection_item.item_type = ContentType.photo
    @collection_item.is_header = false
    @collection_item.save

    assert_equal(@collection.collection_items.first, @collection_item,  "Collection does not contain collection item")
    @collection_item.destroy!
    @collection.destroy!
    @user.destroy!
  end

  test "CollectionItem.create_with_activity creates a collection item with associated uer activity" do
    @collection = Collection.create_with_activity(user_id: @user.id, title: 'A Collection To Test', description: 'Description of a collection')
    @collection_item = CollectionItem.create_with_activity(user_id: @user.id, collection_id: @collection.id, file: "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg", is_header: false, item_type: ContentType.photo)
    assert @collection_item.user_activities.count > 0, 'the collection does not have an activity to deconstruct'
    assert @user.user_activities.count > 0
    assert @collection.destroy
  end
end
