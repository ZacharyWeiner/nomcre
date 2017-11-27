class AddQuestion1ToWaitlists < ActiveRecord::Migration[5.1]
  def change
    add_column :waitlists, :question_1, :text
  end
end
