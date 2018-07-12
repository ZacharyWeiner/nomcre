class ChangePageSectionContentToText < ActiveRecord::Migration[5.1]
  def change
    change_column :page_sections, :content, :text
  end
end
