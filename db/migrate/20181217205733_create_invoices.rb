class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :project, foreign_key: true
      t.references :company, foreign_key: true
      t.references :payment, foreign_key: true
      t.decimal :amount
      t.date :due_date
      t.string :invoice_type

      t.timestamps
    end
  end
end
