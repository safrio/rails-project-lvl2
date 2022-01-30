class Comment < ApplicationRecord
  has_ancestry

  belongs_to :post
end
