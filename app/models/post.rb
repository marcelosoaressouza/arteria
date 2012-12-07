class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license
  belongs_to :item

  attr_accessible :content, :published, :slug, :title, :user_id, :license_id, :tag_list,  :item_id

  extend FriendlyId
  friendly_id :title, use: :slugged
end
