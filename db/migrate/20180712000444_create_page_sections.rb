class CreatePageSections < ActiveRecord::Migration[5.1]
  def change
    create_table :page_sections do |t|
      t.references :page, foreign_key: true
      t.string :title
      t.string :content
      t.integer :order

      t.timestamps
    end
  end
end
