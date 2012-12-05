class License < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :name, :user_id

  extend FriendlyId
  friendly_id :name, use: :slugged
end
