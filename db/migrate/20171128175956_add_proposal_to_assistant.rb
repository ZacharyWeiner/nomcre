class AddProposalToAssistant < ActiveRecord::Migration[5.1]
  def change
    add_reference :assistants, :proposal, foreign_key: true
  end
end
