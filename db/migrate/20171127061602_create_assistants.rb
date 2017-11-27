class CreateAssistants < ActiveRecord::Migration[5.1]
  def change
    create_table :assistants do |t|
      t.string :name
      t.string :paypal_email
      t.string :phone
      t.integer :rate
      t.string :assistant_type
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
