class AddOrderToCollectionItems < ActiveRecord::Migration[5.1]
  def change
    add_column :collection_items, :order, :integer
  end
end
