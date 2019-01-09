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
  test "Collection deconstructs properly" do
    #create a collection
    #make sure user Activites are added to the collection
    #delete the collection
    @collection = Collection.create_with_activity(user_id: @user.id, title: 'A Collection To Test', description: 'Description of a collection')
    @collection_item = CollectionItem.create_with_activity(user_id: @user.id, collection_id: @collection.id, file: "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg", is_header: false, item_type: ContentType.photo)

    assert @collection.collection_items.count > 0, 'the collection does not have an item to deconstruct'
    assert @collection.user_activities.count > 0, 'the collection does not have an activity to deconstruct'

    assert @collection.destroy

  end

  test "Create A Collection with User Activity" do
    #create a collection
    #make sure user Activites are added to the collection
    #delete the collection
    @collection = Collection.create_with_activity(user_id: @user.id, title: 'A Collection To Test', description: 'Description of a collection')

    assert @collection.user_activities.count > 0, 'the collection does not have an activity to deconstruct'
    assert @user.user_activities.count > 0
    assert @collection.destroy

  end

  #TODO: Figure out how to work with the file uploader, related files to collection items are nil, becuase there is no server action to upload them.

  # test "Collection.get_jumbotron_url gets correct url" do
  #   #Create a collection
  #   @collection = Collection.create_with_activity(user_id: @user.id, title: 'A Collection To Test', description: 'Description of a collection')
  #   #Add 2 Collection Items where one is marked as header
  #   @collection_item = CollectionItem.create_with_activity(user_id: @user.id, collection_id: @collection.id, file: "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg", is_header: false, item_type: ContentType.photo)
  #   @collection_item_as_head = CollectionItem.create_with_activity(user_id: @user.id, collection_id: @collection.id, file: "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-18.jpg", is_header: true, item_type: ContentType.photo)
  #   #use the method to get the correct item
  #   url = Collection.get_jumbotron_url @collection
  #   byebug
  #   assert_equal url, @collection_item_as_head.file.url, "The returned url and @collection_item url are not equal " ;
  #   assert @collection.destroy
  # end

  # test "get_header_or_first gets correct url" do
  #   #Create a collection
  #   #Add 2 Collection Items where the 2nd is marked as header
  #   #use the method to get the correct item (1st)
  #   #assert false;
  # end
end
