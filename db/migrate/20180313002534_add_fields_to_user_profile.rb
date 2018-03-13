class AddFieldsToUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :paypal_or_venmo, :string
    add_column :user_profiles, :account_name, :string
  end
end
