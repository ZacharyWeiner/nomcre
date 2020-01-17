class CreateDeliverableTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :deliverable_types do |t|
      t.string :name
      t.text :specification

      t.timestamps
    end
  end
end
