class CreateEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :example_image
      t.string :description

      t.timestamps
    end
  end
end
