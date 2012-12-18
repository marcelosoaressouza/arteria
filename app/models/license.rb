class License < ActiveRecord::Base
  resourcify

  belongs_to :user

  attr_accessible :description, :name, :user_id

  extend FriendlyId
  friendly_id :name, use: :slugged
end
