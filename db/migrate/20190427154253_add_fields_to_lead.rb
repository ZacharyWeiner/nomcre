class AddFieldsToLead < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :first_name, :string
    add_column :leads, :last_name, :string
    add_column :leads, :company, :string
    add_column :leads, :title, :string
    add_column :leads, :city, :string
    add_column :leads, :state, :string
    add_column :leads, :zip, :string
    add_column :leads, :address, :string
    add_column :leads, :phone, :string
    add_column :leads, :linked_in_id, :string
    add_column :leads, :profile_picture, :string
    add_column :leads, :summary, :string
    add_column :leads, :company_profile, :string
    add_column :leads, :company_website, :string
    add_column :leads, :twitter, :string
    add_column :leads, :instagram, :string
    add_column :leads, :industry, :string
    add_column :leads, :my_tags, :string
    add_column :leads, :my_notes, :string
  end
end
