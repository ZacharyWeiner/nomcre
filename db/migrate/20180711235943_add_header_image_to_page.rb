class AddHeaderImageToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :header_image, :string
  end
end
