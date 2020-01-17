class CreateSceneDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :scene_deliverables do |t|
      t.references :scene, foreign_key: true
      t.references :deliverable, foreign_key: true

      t.timestamps
    end
  end
end
