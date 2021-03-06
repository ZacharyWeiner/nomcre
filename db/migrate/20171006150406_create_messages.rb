class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
      t.text :content
      t.text :file

      t.timestamps
    end
  end
end
