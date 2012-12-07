class Item < ActiveRecord::Base
  # From
  belongs_to :gallery

  # To
  belongs_to :audio
  belongs_to :video
  belongs_to :image
  belongs_to :post

  attr_accessible :gallery_id, :audio_id, :video_id, :image_id, :post_id
end
