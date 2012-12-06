class Video < ActiveRecord::Base
  belongs_to :user
  belongs_to :license

  attr_accessible :description, :published, :slug, :title, :video, :user_id, :license_id

  has_attached_file :video,
                    :url => "/system/users/:user_id/videos/:id/:filename",
                    :path => ":rails_root/public/system/users/:user_id/videos/:id/:filename",
                    :styles => { :medium => { :geometry => "640x480", :format => 'flv' },
                                 :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
                               }, :processors => [:ffmpeg]

  extend FriendlyId
  friendly_id :title, use: :slugged
end
