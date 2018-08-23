class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :company_name
      t.string :office_phone
      t.string :cell_phone
      t.date :last_contacted
      t.date :next_contact

      t.timestamps
    end
  end
end
