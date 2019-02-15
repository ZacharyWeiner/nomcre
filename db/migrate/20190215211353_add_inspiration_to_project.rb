class AddInspirationToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :image_board_1, :string
    add_column :projects, :image_board_2, :string
    add_column :projects, :image_board_3, :string
    add_column :projects, :image_board_4, :string
    add_column :projects, :insta_inspiration_1, :string
    add_column :projects, :insta_inspiration_2, :string
    add_column :projects, :insta_inspiration_3, :string
    add_column :projects, :insta_inspiration_4, :string
  end
end
