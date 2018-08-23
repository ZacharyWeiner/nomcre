class AddImageBoardsToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :image_board_1, :string
    add_column :proposals, :image_board_2, :string
    add_column :proposals, :image_board_3, :string
    add_column :proposals, :image_board_4, :string
  end
end
