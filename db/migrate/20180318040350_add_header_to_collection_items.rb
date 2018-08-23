class AddHeaderToCollectionItems < ActiveRecord::Migration[5.1]
  def change
    add_column :collection_items, :is_header, :boolean
  end
end
