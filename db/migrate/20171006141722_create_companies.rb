class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
