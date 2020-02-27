class AddIndexToHappyBirthdayVideos < ActiveRecord::Migration[5.1]
  def change
    add_index :happy_birthday_videos, :name, unique: true
  end
end
