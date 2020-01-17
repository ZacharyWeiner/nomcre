class CreateStoryVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :story_videos do |t|
      t.references :story, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
