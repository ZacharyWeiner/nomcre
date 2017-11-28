class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.string :display_name
      t.text :description
      t.text :shot_preference, array: true, default: []
      t.text :content_type, array: true, default: []
      t.string :profile_photo
      t.string :header_image

      t.timestamps
    end
  end
end
