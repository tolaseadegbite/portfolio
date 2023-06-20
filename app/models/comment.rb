class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, dependent: :destroy, foreign_key: :parent_id

  validates :body, presence: true, length: { minimum: 1, maximum: 5000}
end
