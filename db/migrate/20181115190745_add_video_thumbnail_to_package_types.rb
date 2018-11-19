class AddVideoThumbnailToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :example_video_thumbnail, :string
  end
end
