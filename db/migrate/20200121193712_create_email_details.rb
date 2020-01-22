class CreateEmailDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :email_details do |t|
      t.references :email, foreign_key: true
      t.string :detail_type
      t.text :content
      t.integer :order

      t.timestamps
    end
  end
end
