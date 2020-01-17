class CreateStoryDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :project_deliverables do |t|
      t.references :project, foreign_key: true
      t.references :deliverable, foreign_key: true

      t.timestamps
    end
    create_table :story_deliverables do |t|
      t.references :story, foreign_key: true
      t.references :deliverable, foreign_key: true

      t.timestamps
    end
  end
end
