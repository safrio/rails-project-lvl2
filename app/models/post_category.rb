class PostCategory < ApplicationRecord
  has_many :posts, dependent: :delete_all

  def to_s
    name
  end
end