class AddLocationToLead < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :location, :string
  end
end
