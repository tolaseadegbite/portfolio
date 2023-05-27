class User < ApplicationRecord
  # before_save :downcase_username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true

  

  private

  # Converts username to all lowercase.
  def downcase_username
    self.username.downcase!
  end
end
