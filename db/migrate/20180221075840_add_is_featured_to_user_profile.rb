class AddIsFeaturedToUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :is_featured, :boolean
  end
end
