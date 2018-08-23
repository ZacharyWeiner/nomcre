class AddQuestionsToWaitlist < ActiveRecord::Migration[5.1]
  def change
    add_column :waitlists, :question_2, :text
    add_column :waitlists, :question_3, :text
    add_column :waitlists, :question_4, :text
    add_column :waitlists, :question_5, :text
    add_column :waitlists, :question_6, :text
  end
end
