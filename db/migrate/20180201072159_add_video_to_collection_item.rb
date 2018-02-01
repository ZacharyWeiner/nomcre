class AddVideoToCollectionItem < ActiveRecord::Migration[5.1]
  def change
    add_column :collection_items, :video, :string
  end
end
