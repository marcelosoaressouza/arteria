class Audio < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license

  has_many   :items
  has_many   :galleries, :through => :items, :dependent => :destroy

  accepts_nested_attributes_for :galleries
  accepts_nested_attributes_for :items

  attr_accessible :description, :published, :slug, :title, :audio, :user_id, :license_id, :tag_list, :item_id, :items_attributes

  has_attached_file :audio,
                    :url => "/system/users/:user_id/audios/:id/:filename",
                    :path => ":rails_root/public/system/users/:user_id/audios/:id/:filename",
                    :styles => { :medium => { :geometry => "640x480", :format => 'flv' } }, :processors => [:ffmpeg]

  extend FriendlyId
  friendly_id :title, use: :slugged
end
