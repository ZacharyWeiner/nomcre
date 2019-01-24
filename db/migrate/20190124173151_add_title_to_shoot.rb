class AddTitleToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :title, :string
  end
end
