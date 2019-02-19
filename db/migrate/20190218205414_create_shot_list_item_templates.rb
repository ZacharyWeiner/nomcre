class CreateShotListItemTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_list_item_templates do |t|
      t.string :description
      t.string :background
      t.string :item_type
      t.string :focus_point
      t.string :reference_image
      t.string :aspect_ratio
      t.string :frame_rate
      t.references :task_group, foreign_key: true

      t.timestamps
    end
  end
end
