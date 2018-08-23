class CreateLeadNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :lead_notes do |t|
      t.string :note
      t.references :lead, foreign_key: true

      t.timestamps
    end
  end
end
