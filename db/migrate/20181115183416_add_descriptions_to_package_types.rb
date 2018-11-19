class AddDescriptionsToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :example_image_description, :text
    add_column :package_types, :example_video_description, :text
  end
end
