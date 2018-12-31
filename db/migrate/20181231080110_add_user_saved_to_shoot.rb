class AddUserSavedToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :user_saved, :boolean
  end
end
