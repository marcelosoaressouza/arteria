class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.boolean :published
      t.references :user
      t.references :license

      t.timestamps
    end
    add_index :videos, :user_id
    add_index :videos, :license_id
  end
end
