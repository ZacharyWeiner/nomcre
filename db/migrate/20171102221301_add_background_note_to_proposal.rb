class AddBackgroundNoteToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :background_note, :string
  end
end
