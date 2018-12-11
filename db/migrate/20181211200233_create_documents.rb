class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :proposal, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :assistant, foreign_key: true
      t.string :title
      t.string :file
      t.string :media
      t.string :document_type
      t.boolean :is_template

      t.timestamps
    end
  end
end
