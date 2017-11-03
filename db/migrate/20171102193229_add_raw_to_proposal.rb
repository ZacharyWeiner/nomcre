class AddRawToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :raw, :boolean
  end
end
