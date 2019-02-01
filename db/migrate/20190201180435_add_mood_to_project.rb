class AddMoodToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :mood, :string
  end
end
