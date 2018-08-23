class ChangeColumnOnLeadNote < ActiveRecord::Migration[5.1]
  def change
     change_column :lead_notes, :note, :text
  end
end
