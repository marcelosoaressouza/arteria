class Image < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license
  has_many   :items
  has_many   :galleries, :through => :items, :dependent => :destroy

  accepts_nested_attributes_for :galleries
  accepts_nested_attributes_for :items

  attr_accessible :description, :published, :slug, :title, :image, :user_id, :license_id, :tag_list, :item_id, :items_attributes

  has_attached_file :image,
                    :url => "/system/users/:user_id/images/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/system/users/:user_id/images/:id/:basename_:style.:extension",
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
