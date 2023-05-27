class User < ApplicationRecord
  # before_save :downcase_username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, length: { maximum: 15, minimum: 3 }, allow_blank: true

  before_save :set_display_name, if: -> { display_name.blank? }

  private

  # Converts username to all lowercase.
  def downcase_username
    self.username.downcase!
  end

  def set_display_name
    self.display_name = username.humanize
  end
end
