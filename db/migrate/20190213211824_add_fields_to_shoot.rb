class AddFieldsToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :shoot_date, :date
    add_column :shoots, :call_time, :time
    add_column :shoots, :set_location_rental, :boolean
    add_column :shoots, :rental_price, :decimal
    add_column :shoots, :tranportation_required, :boolean
    add_column :shoots, :address_or_landmark, :string
    add_column :shoots, :set_contact_name, :string
    add_column :shoots, :set_contact_phone, :string
    add_column :shoots, :parking_details, :string
    add_column :shoots, :rental_details, :text
    add_column :shoots, :other_details, :text
  end
end
