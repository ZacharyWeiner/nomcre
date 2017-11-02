class AddInstagramToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :instagram, :string
  end
end
