class AddShootTypeToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :shoot_type, :string
  end
end
