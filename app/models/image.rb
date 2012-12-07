class Image < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license

  attr_accessible :description, :published, :slug, :title, :image, :user_id, :license_id, :tag_list

  has_attached_file :image,
                    :url => "/system/users/:user_id/images/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/system/users/:user_id/images/:id/:basename_:style.:extension",
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
