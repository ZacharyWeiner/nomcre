class CreateShotListItemDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_list_item_deliverables do |t|
      t.references :shot_list_item, foreign_key: true
      t.references :deliverable, foreign_key: true

      t.timestamps
    end
  end
end
