class CreateCongratulationsVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :congratulations_videos do |t|
      t.string :name
      t.string :file
      t.string :cover
      t.string :slug

      t.timestamps
    end
  end
end
