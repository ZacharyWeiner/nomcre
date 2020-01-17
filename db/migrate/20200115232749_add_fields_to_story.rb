class AddFieldsToStory < ActiveRecord::Migration[5.1]
  def change
    add_reference :stories, :company, foreign_key: true
  end
end
