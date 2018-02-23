class CreateUserActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_activities do |t|
      t.string :activity_type
      t.references :user, foreign_key: true
      t.bigint :object_id

      t.timestamps
    end
  end
end
