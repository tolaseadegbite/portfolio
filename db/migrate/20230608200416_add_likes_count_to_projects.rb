class AddLikesCountToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :likes_count, :integer, null: false, default: 0
  end
end
