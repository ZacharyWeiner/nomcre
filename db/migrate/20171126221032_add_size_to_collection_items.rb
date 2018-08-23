class AddSizeToCollectionItems < ActiveRecord::Migration[5.1]
  def change
    add_column :collection_items, :height, :integer
    add_column :collection_items, :width, :integer
  end
end
