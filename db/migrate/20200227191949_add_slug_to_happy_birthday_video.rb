class AddSlugToHappyBirthdayVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :happy_birthday_videos, :slug, :string
  end
end
