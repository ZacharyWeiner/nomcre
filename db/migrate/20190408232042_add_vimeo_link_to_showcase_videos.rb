class AddVimeoLinkToShowcaseVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :showcase_videos, :vimeo_link, :string
  end
end
