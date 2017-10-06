class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :views

      t.timestamps
    end
  end
end
