class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.string :topic
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
