class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10, maximum: 500 }
  validates :body, presence: true, length: { minimum: 500 }

  belongs_to :user
  has_many :comments, as: :commentable

  has_many :likes, as: :likeable

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end

  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size: { less_than: 5.megabytes,
                              message:   "should be less than 5MB" }
end
