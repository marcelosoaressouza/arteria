class Gallery < ActiveRecord::Base
  acts_as_taggable_on :tags

  searchable do
    text :title, :description
    time :created_at
  end

  belongs_to :user
  belongs_to :license

  has_many :items,  :dependent => :destroy
  has_many :posts,  :through   => :items
  has_many :audios, :through   => :items
  has_many :videos, :through   => :items
  has_many :images, :through   => :items

  belongs_to :post
  belongs_to :audio
  belongs_to :video
  belongs_to :image

  attr_accessible :description, :published, :slug, :title, :user_id, :license_id, :item_id, :tag_list

  extend FriendlyId
  friendly_id :title, use: :slugged	
end
