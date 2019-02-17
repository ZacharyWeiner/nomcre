class CreateTaskGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :task_groups do |t|
      t.string :title
      t.references :shoot, foreign_key: true
      t.boolean :complete
      t.bigint :approver_id

      t.timestamps
    end
  end
end
