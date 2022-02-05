class AddCreatorToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :creator, foreign_key: { to_table: :users }
  end
end
