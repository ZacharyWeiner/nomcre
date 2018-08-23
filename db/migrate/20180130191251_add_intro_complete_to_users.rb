class AddIntroCompleteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :intro_complete, :boolean
  end
end
