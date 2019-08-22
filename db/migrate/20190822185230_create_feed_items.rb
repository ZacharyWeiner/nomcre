class CreateFeedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :feed_items do |t|
      t.string :title
      t.string :description
      t.text :body

      t.timestamps
    end
  end
end
