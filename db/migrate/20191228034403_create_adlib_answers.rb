class CreateAdlibAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :adlib_answers do |t|
      t.string :contact
      t.text :answers

      t.timestamps
    end
  end
end
