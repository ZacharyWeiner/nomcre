class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :profile_image, :string
    add_column :users, :user_type, :string
  end
end
