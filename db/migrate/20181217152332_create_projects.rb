class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :package_type, foreign_key: true
      t.references :company, foreign_key: true
      t.string :title
      t.text :brief
      t.date :deadline
      t.decimal :price
      t.decimal :deposit
      t.decimal :balance
      t.boolean :is_complete
      t.date :completed_on
      t.integer :max_user_shot_list

      t.timestamps
    end
  end
end
