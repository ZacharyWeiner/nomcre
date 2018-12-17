class AddShootToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_reference :documents, :shoot, foreign_key: true
  end
end
