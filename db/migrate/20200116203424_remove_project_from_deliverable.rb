class RemoveProjectFromDeliverable < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliverables, :project_id
  end
end
