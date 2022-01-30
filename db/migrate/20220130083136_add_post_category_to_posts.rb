class AddPostCategoryToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :post_category, null: false, foreign_key: true, index: true
  end
end
