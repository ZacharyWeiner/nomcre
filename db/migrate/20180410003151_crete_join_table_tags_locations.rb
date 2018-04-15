class CreteJoinTableTagsLocations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :locations do |t|
      t.references :tag, foreign_key: true
      t.references :location, foreign_key: true
    end
  end
end
