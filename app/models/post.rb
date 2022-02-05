# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :text, presence: true
  validates :text, length: { minimum: 50 }

  belongs_to :creator, class_name: 'User'
  belongs_to :category, class_name: 'PostCategory'
  has_many :comments, inverse_of: :post, dependent: :destroy, class_name: 'PostComment'
  has_one :like, dependent: :destroy, class_name: 'PostLike'
end
