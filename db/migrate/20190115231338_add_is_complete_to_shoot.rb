class AddIsCompleteToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :is_complete, :boolean
  end
end
