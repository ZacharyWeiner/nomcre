class CreatejoinTableProjectDiscountCodes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :discount_codes do |t|
      t.references :project, foreign_key: true
      t.references :discount_code, foreign_key: true
    end
  end
end
