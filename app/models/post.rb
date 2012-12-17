class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

  searchable do
    text :title, :content
    time :created_at
  end

  belongs_to :user
  belongs_to :license

  has_many   :items
  has_many   :galleries, :through => :items, :dependent => :destroy

  accepts_nested_attributes_for :galleries
  accepts_nested_attributes_for :items

  attr_accessible :content, :published, :slug, :title, :user_id, :license_id, :tag_list,  :item_id, :items_attributes

  extend FriendlyId
  friendly_id :title, use: :slugged
end
