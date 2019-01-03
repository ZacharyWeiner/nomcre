class AddDeadlineToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :deadline, :date
  end
end
