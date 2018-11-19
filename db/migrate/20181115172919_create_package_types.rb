class CreatePackageTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :package_types do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :description_image
      t.string :example_image
      t.string :example_video
      t.references :header_image, foreign_key: true
      t.boolean :show_in_menu
      t.text :menu_link_text
      t.integer :minimum_images
      t.integer :minimum_videos
      t.integer :max_models
      t.decimal :base_price

      t.timestamps
    end
  end
end
