class AddContentToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :content, :text
  end
end
