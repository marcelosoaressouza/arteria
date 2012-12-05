class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license

  attr_accessible :content, :published, :slug, :title, :user_id, :license_id, :tag_list

  extend FriendlyId
  friendly_id :title, use: :slugged
end
