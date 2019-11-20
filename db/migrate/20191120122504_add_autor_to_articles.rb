class AddAutorToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :autor, :text
  end
end
