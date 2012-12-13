class Video < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license
  has_many   :items
  has_many   :galleries, :through => :items, :dependent => :destroy

  accepts_nested_attributes_for :galleries
  accepts_nested_attributes_for :items

  attr_accessible :description, :published, :slug, :title, :video, :user_id, :license_id, :tag_list, :item_id, :items_attributes

  has_attached_file :video,
                    :url => "/system/users/:user_id/videos/:id/:filename",
                    :path => ":rails_root/public/system/users/:user_id/videos/:id/:filename",
                    :styles => { :medium => { :geometry => "640x480", :format => 'flv' },
                                 :thumb  => { :geometry => "300x300#", :format => 'jpg', :time => 10 }
                               }, :processors => [:ffmpeg]

  extend FriendlyId
  friendly_id :title, use: :slugged
end
