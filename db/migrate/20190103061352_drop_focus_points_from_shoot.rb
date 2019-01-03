class DropFocusPointsFromShoot < ActiveRecord::Migration[5.1]
  def change
    remove_column :shoots, :focus_points
  end
end
