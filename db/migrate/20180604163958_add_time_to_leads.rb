class AddTimeToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :next_contact_time, :time
  end
end
