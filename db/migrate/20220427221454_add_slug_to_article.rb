class AddSlugToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :slug, :string, unique: true, null: false
  end
end
