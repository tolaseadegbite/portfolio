class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :project
  belongs_to :taggable, polymorphic: true
end
