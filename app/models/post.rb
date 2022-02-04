class Post < ApplicationRecord
  validates :title, :text, presence: true
  validates :text, length: { minimum: 50 }

  belongs_to :creator, class_name: 'User'
  belongs_to :category, class_name: 'PostCategory'
  has_many :comments, inverse_of: :post, class_name: 'PostComment'
end
