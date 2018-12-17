class AddShootToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :shoot, foreign_key: true
  end
end
