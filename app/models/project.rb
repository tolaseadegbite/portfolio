class Project < ApplicationRecord
  belongs_to :user

  validates :title, :description, :github_link, presence: true
end
