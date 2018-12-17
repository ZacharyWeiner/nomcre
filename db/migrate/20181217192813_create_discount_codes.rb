class CreateDiscountCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.string :discount_type
      t.date :expiration_date
      t.integer :max_uses
      t.integer :discount
      t.timestamps
    end
  end
end
