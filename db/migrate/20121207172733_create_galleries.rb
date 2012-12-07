class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.boolean :published
      t.references :user
      t.references :license

      t.timestamps
    end
    add_index :galleries, :user_id
    add_index :galleries, :license_id
    add_index :galleries, :slug, unique: true
  end
end
