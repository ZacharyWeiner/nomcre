class AddHeightAndWithToShowcaseImages < ActiveRecord::Migration[5.1]
  def change
    add_column :showcase_images, :height, :integer
    add_column :showcase_images, :width, :integer
  end
end
