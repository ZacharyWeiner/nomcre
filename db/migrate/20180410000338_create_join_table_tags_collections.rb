class CreateJoinTableTagsCollections < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :collections do |t|
      t.references :tag, foreign_key: true
      t.references :collection, foreign_key: true
    end
  end
end
