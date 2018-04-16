class AddFieldsToShotListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :shot_list_items, :reference_image, :string
    add_column :shot_list_items, :aspect_ratio, :string
  end
end
