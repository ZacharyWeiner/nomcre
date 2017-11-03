class AddInstagramFieldsToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :instagram_1, :string
    add_column :proposals, :instagram_2, :string
    add_column :proposals, :instagram_3, :string
    add_column :proposals, :instagram_4, :string
  end
end
