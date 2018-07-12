class AddIsBlogToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :is_blog, :boolean
  end
end
