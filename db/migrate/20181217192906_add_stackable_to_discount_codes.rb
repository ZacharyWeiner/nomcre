class AddStackableToDiscountCodes < ActiveRecord::Migration[5.1]
  def change
    add_column :discount_codes, :stackable, :boolean
  end
end
