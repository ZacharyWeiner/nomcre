class AddFrameRateToShotListItem < ActiveRecord::Migration[5.1]
  def change
    add_column :shot_list_items, :frame_rate, :string
  end
end
