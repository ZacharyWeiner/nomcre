class CreateShowcaseVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :showcase_videos do |t|
      t.string :file
      t.string :showcase_type
      t.boolean :show
      t.integer :order
      t.string :title
      t.text :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
