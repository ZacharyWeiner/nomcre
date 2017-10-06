class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.bigint :parent_id
      t.string :location_type

      t.timestamps
    end
  end
end
