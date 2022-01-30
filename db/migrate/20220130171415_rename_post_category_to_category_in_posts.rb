class RenamePostCategoryToCategoryInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :post_category_id, :category_id
    change_column :posts, :category_id, :reference, foreign_key: { to_table: :post_categories }
  end
end
