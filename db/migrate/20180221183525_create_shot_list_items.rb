class CreateShotListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_list_items do |t|
      t.references :proposal, foreign_key: true
      t.string :description
      t.string :background
      t.string :upload
      t.string :item_type
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
