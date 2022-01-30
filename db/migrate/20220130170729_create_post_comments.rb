class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
