class Tag < ApplicationRecord
    validates :name, :category, presence: true
	validates :name, length: {minimum: 1, maximum: 25}, uniqueness: { scope: :category, message: "uniquene per category" }
  
    def to_s
        name
    end

    CATEGORIES = [:project, :blog, :teacher]
    def self.categories
        CATEGORIES.map { |category| [category, category] }
    end
    has_many :taggings, dependent: :destroy
    has_many :projects, :through => :taggings, :source => :taggable,
    :source_type => 'Project'
end