class AddCommentsCountToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comments_count, :integer, null: false, default: 0
  end
end
