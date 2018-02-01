class AddItemTypeToCollectionItem < ActiveRecord::Migration[5.1]
  def change
    add_column :collection_items, :item_type, :string
  end
end
