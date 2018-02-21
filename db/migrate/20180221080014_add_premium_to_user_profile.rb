class AddPremiumToUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :premium, :boolean
  end
end
