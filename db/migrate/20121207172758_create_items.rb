class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :gallery
      t.references :audio
      t.references :video
      t.references :image
      t.references :post

      t.timestamps
    end
    add_index :items, :gallery_id
    add_index :items, :audio_id
    add_index :items, :video_id
    add_index :items, :image_id
    add_index :items, :post_id
  end
end
