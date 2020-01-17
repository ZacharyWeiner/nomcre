class CreateDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :deliverables do |t|
      t.references :deliverable_type, foreign_key: true
      t.string :asset
      t.references :project, foreign_key: true
      t.boolean :approved
      t.string :slug
      t.string :review_link
      t.string :status

      t.timestamps
    end
  end
end
