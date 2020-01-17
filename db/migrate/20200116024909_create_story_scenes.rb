class CreateStoryScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :story_scenes do |t|
      t.references :story, foreign_key: true
      t.references :scene, foreign_key: true

      t.timestamps
    end
  end
end
