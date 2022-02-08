# frozen_string_literal: true

class PostCategory < ApplicationRecord
  validates :name, presence: true

  has_many :posts, dependent: :destroy

  def to_s
    name
  end
end
