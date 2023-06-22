class AddPostsCountToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :posts_count, :integer, null: false, default: 0

    User.find_each do |user|
      user.update! posts_count: user.posts.size 
    end
  end

  def down
    remove_column :users, :posts_count
  end
end
