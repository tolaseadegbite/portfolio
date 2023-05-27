class User < ApplicationRecord
  before_save { downcase_username }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, allow_blank: true



  private

  # Converts username to all lowercase.
  def downcase_username
    self.username = username.downcase
  end
end
