class AddAddDefaultShotListToPackageType < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :add_default_shot_list, :boolean
  end
end
