class CreateExternalLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :external_links do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
