class AddShotCountToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :shot_count, :integer
  end
end
