class AddPaidOnToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :balance_paid_on, :date
  end
end
