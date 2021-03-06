# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121219185427) do

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  add_index "audios", ["license_id"], :name => "index_audios_on_license_id"
  add_index "audios", ["slug"], :name => "index_audios_on_slug", :unique => true
  add_index "audios", ["user_id"], :name => "index_audios_on_user_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galleries", ["license_id"], :name => "index_galleries_on_license_id"
  add_index "galleries", ["slug"], :name => "index_galleries_on_slug", :unique => true
  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["license_id"], :name => "index_images_on_license_id"
  add_index "images", ["slug"], :name => "index_images_on_slug", :unique => true
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "items", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "audio_id"
    t.integer  "video_id"
    t.integer  "image_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["audio_id"], :name => "index_items_on_audio_id"
  add_index "items", ["gallery_id"], :name => "index_items_on_gallery_id"
  add_index "items", ["image_id"], :name => "index_items_on_image_id"
  add_index "items", ["post_id"], :name => "index_items_on_post_id"
  add_index "items", ["video_id"], :name => "index_items_on_video_id"

  create_table "licenses", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "licenses", ["slug"], :name => "index_licenses_on_slug", :unique => true
  add_index "licenses", ["user_id"], :name => "index_licenses_on_user_id"

  create_table "menus", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["license_id"], :name => "index_posts_on_license_id"
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "rsses", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "videos", ["license_id"], :name => "index_videos_on_license_id"
  add_index "videos", ["slug"], :name => "index_videos_on_slug", :unique => true
  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"

end
