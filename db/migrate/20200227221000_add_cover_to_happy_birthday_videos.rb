class AddCoverToHappyBirthdayVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :happy_birthday_videos, :cover, :string
  end
end
