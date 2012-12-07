class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.boolean :published
      t.references :user
      t.references :license

      t.timestamps
    end
    add_index :audios, :user_id
    add_index :audios, :license_id
    add_index :audios, :slug, unique: true
  end
end
