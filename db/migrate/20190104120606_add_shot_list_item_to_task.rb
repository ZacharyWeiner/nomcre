class AddShotListItemToTask < ActiveRecord::Migration[5.1]
  def change
   change_table :tasks do |t|
      t.references :shot_list_item
    end
  end
end
