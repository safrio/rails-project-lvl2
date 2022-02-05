# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :body, length: { minimum: 50 }

  belongs_to :creator, class_name: 'User'
  belongs_to :post_category
  has_many :comments, inverse_of: :post, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, class_name: 'PostLike'
end
