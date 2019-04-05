class AddFaqToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :is_faq, :boolean
  end
end
