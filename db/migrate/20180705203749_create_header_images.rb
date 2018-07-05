class CreateHeaderImages < ActiveRecord::Migration[5.1]
  def change
    create_table :header_images do |t|
      t.string :title
      t.string :file
      t.boolean :homepage
      t.boolean :showcase
      t.boolean :creators

      t.timestamps
    end
  end
end
