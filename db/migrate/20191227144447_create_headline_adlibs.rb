class CreateHeadlineAdlibs < ActiveRecord::Migration[5.1]
  def change
    create_table :headline_adlibs do |t|
      t.string :title
      t.integer :stage

      t.timestamps
    end
  end
end
