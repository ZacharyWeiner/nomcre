class CreateCreativeRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :creative_requests do |t|
      t.references :shoot, foreign_key: true
      t.bigint :requested_by_id
      t.bigint :creative_id
      t.references :company, foreign_key: true
      t.boolean :accepted
      t.date :accepted_on
      t.date :deadline
      t.boolean :approved
      t.boolean :declined

      t.timestamps
    end
  end
end
