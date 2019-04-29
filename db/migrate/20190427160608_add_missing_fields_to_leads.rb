class AddMissingFieldsToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :visit_time, :string
    add_column :leads, :linkedin_profile, :string
    add_column :leads, :picture, :string
    add_column :leads, :degree, :string
    add_column :leads, :middle_name, :string
    add_column :leads, :from, :string
    add_column :leads, :personal_website, :string
    add_column :leads, :im, :string
  end
end
