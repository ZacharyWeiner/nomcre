class AddOrderToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :order, :integer
  end
end
