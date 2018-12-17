class CreateShoots < ActiveRecord::Migration[5.1]
  def change
    create_table :shoots do |t|
      t.bigint :creative_id
      t.references :project, foreign_key: true
      t.references :company, foreign_key: true
      t.references :location, foreign_key: true
      t.string :content_type
      t.text :brief
      t.string :time_of_day
      t.string :bts
      t.string :focus_points
      t.decimal :price
      t.string :background
      t.string :background_note
      t.string :shoot_style
      t.boolean :shoot_raw
      t.integer :user_added_shot_count
      t.integer :user_added_shot_count_max

      t.timestamps
    end
  end
end
