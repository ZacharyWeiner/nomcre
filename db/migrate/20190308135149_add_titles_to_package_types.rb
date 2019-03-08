class AddTitlesToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :page_header, :string
    add_column :package_types, :description_text_title, :string
    add_column :package_types, :description_text_subtitle, :string
    add_column :package_types, :example_image_title, :string
    add_column :package_types, :example_image_subtitle, :string
    add_column :package_types, :example_video_title, :string
    add_column :package_types, :example_video_subtitle, :string
  end
end
