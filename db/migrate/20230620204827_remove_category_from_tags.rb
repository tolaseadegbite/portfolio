class RemoveCategoryFromTags < ActiveRecord::Migration[7.0]
  def change
    remove_column :tags, :category, :string
  end
end
