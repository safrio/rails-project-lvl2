class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :category, foreign_key: { to_table: :post_categories }

      t.timestamps
    end
  end
end
