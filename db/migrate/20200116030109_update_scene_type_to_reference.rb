class UpdateSceneTypeToReference < ActiveRecord::Migration[5.1]
  def change
    remove_column :scenes, :scene_type, :string
    add_column :scenes, :scene_type, :bigint, references: :scene_types
  end
end
