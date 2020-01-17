class CreateScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.string :title
      t.string :transition
      t.text :script
      t.integer :duration
      t.string :location
      t.string :action
      t.string :scene_type
      t.string :music
      t.integer :position

      t.timestamps
    end
  end
end
