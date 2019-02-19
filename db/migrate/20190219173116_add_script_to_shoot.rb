class AddScriptToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :script, :text
  end
end
