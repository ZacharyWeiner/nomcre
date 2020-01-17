class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :type
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
