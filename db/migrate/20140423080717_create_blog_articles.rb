class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.references :category, index: true
      t.string :title
      t.string :slug
      t.text :body

      t.timestamps
    end
  end
end
