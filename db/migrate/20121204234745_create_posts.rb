class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.boolean :published
      t.references :user
      t.references :license

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :license_id
    add_index :posts, :slug, unique: true
  end
end
