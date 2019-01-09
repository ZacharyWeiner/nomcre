require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(name: 'Testy Mc Tester', email: 'Testy@mctester.com', password: 'password', password_confirmation: 'password')
  end

  test "Create An Image Collection Without a Title" do
    @collection = Collection.new
    @collection.user = @user
    @collection.title = nil
    @collection.description = 'Testy Mc Tester description'
    assert_not @collection.save, "Saved the collection without a title"

    @user.destroy!
  end

  test "Create An Image Collection Without a description" do
    @collection = Collection.new
    @collection.user = @user
    @collection.title = 'Testy Mc Tester title'
    @collection.description = nil
    assert_not @collection.save, "Saved the collection without a description"

    @user.destroy!
  end

  test "Create An Image Collection Without a user" do
    @collection = Collection.new
    @collection.user = nil
    @collection.title = 'Testy Mc Tester title'
    @collection.description = nil
    assert_not @collection.save, "Saved the collection without a user"

    @user.destroy!
  end

  test "Create An Image Collection With all fields" do
    @collection = Collection.new
    @collection.user = @user
    @collection.title = 'Testy Mc Tester title'
    @collection.description = 'Testy Mc Tester description'
    assert @collection.save, "Saved the collection without a description"
    @collection.destroy!
    @user.destroy!
  end

  test "Collection Has Item " do
    @collection = Collection.new
    @collection.user = @user
    @collection.title = 'Testy Mc Tester title'
    @collection.description = 'Testy Mc Tester description'
    @collection.save!

    @collection_item = CollectionItem.create!(user: @user, collection: @collection, file: "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg", is_header: false, item_type: ContentType.photo)

    assert_equal(@collection.collection_items.first, @collection_item, "Collection -  contains collection item")

    @collection_item.destroy!
    @collection.destroy!
    @user.destroy!
  end

  #TODO: Write Tests For Each Method of the Model
end
