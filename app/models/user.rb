class User < ApplicationRecord
  # before_save :downcase_username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, length: { maximum: 15, minimum: 3 }, allow_blank: true

  before_save :set_display_name, if: -> { display_name.blank? }

  has_one_attached :avatar do |attachable|
    attachable.variant :display, resize_to_limit: [150, 150]
  end

  validates :avatar,   content_type: { in: %w[image/jpeg image/png],
                                      message: "must be a valid image format" },
                      size: { less_than: 2.megabytes,
                              message:   "should be less than 2MB" }

  private

  # Converts username to all lowercase.
  def downcase_username
    self.username.downcase!
  end

  def set_display_name
    self.display_name = username.humanize
  end
end
