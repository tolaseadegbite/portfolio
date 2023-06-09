class Project < ApplicationRecord
  belongs_to :user

  self.per_page = 6

  has_many :likes, as: :likeable

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :comments, as: :commentable

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end

  has_rich_text :description

  validates :title, :description, :github_link, presence: true

  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size: { less_than: 5.megabytes,
                              message:   "should be less than 5MB" }
end
