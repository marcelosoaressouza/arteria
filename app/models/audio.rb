class Audio < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :license
  belongs_to :item

  attr_accessible :description, :published, :slug, :title, :audio, :user_id, :license_id, :tag_list, :item_id

  has_attached_file :audio,
                    :url => "/system/users/:user_id/audios/:id/:filename",
                    :path => ":rails_root/public/system/users/:user_id/audios/:id/:filename",
                    :styles => { :medium => { :geometry => "640x480", :format => 'flv' } }, :processors => [:ffmpeg]

  extend FriendlyId
  friendly_id :title, use: :slugged
end
