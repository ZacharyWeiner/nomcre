class CreateStoryLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :story_links do |t|
      t.references :story, foreign_key: true
      t.references :external_link, foreign_key: true

      t.timestamps
    end
  end
end
