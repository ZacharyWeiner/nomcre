class AddShootToAssistants < ActiveRecord::Migration[5.1]
  def change
    add_reference :assistants, :shoot, foreign_key: true
  end
end
