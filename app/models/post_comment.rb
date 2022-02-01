class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :post
end
