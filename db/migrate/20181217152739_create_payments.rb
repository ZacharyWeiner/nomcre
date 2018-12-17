class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :payment_type
      t.string :category
      t.string :payment_method
      t.string :external_id
      t.date :paid_on

      t.timestamps
    end
  end
end
