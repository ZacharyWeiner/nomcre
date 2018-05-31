class AddRepToLead < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :rep_id, :bigint
  end
end
