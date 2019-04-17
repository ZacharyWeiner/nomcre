class AddSlugToPackageTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :package_types, :slug, :string
  end
end
