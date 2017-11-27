class AddCanAcceptToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :can_accept, :string
  end
end
