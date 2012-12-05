class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :licenses, :user_id
    add_index :licenses, :slug, unique: true
  end
end
