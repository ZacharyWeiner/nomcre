class AddDescriptionAndKeywordsToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :description, :text
    add_column :pages, :keywords, :string
  end
end
