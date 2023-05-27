class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :github_link
      t.string :preview_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :projects, [:user_id, :created_at]
  end
end
