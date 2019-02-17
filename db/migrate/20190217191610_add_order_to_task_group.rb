class AddOrderToTaskGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :task_groups, :order, :integer
  end
end
