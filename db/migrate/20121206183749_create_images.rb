class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.boolean :published
      t.references :user
      t.references :license

      t.timestamps
    end
    add_index :images, :user_id
    add_index :images, :license_id
  end
end
