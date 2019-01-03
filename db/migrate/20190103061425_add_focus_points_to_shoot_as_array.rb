class AddFocusPointsToShootAsArray < ActiveRecord::Migration[5.1]
  def change
      add_column :shoots, :focus_points, :string, array: true, default: []
  end
end
