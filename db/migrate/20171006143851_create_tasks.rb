class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.date :deadline
      t.boolean :completed
      t.references :company, foreign_key: true
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
