class AddFeaturedToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :featured, :boolean
    add_column :collections, :description, :string
  end
end
