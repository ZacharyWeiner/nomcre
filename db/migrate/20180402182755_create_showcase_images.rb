class CreateShowcaseImages < ActiveRecord::Migration[5.1]
  def change
    create_table :showcase_images do |t|
      t.string :file
      t.string :showcase_type
      t.boolean :show
      t.integer :order
      t.string :name

      t.timestamps
    end
  end
end
