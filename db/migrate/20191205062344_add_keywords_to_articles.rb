class AddKeywordsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :keywords, :string
  end
end
