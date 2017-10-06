class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :notification_type
      t.bigint :notification_object_id
      t.boolean :read

      t.timestamps
    end
  end
end
