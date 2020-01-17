class CreateShootDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :shoot_deliverables do |t|
      t.references :shoot, foreign_key: true
      t.references :deliverable, foreign_key: true

      t.timestamps
    end
  end
end
