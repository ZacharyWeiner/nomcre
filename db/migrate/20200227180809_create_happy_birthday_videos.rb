class CreateHappyBirthdayVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :happy_birthday_videos do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
