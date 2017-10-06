class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :content
      t.date :deadline
      t.integer :price
      t.boolean :accepted
      t.references :company, foreign_key: true
      t.string :proposal_type
      t.boolean :completed
      t.date :completed_on
      t.boolean :paid
      t.string :charge_id
      t.text :bts, array: true, default: []
      t.text :focus_points, array: true, default: []
      t.string :add_ons, array: true, default: []
      t.string :time_of_day
      t.string :background
      t.references :user, foreign_key: true
      t.string :deposit_id
      t.boolean :deposit_paid
      t.date :deposit_paid_on
      t.text :model_release
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
