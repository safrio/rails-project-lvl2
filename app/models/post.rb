class Post < ApplicationRecord
  validates :title, :text, presence: true
  validates :text, length: { minimum: 50 }

  belongs_to :creator, class_name: 'User'
  belongs_to :category, class_name: 'Post::Category'
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
end
